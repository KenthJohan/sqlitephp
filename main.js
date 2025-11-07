class SQLiteViewer {
    constructor() {
        this.currentTable = '';
        this.currentFilters = {};
        this.schema = [];
        
        this.initializeElements();
        this.bindEvents();
        this.parseHashAndLoadData();
    }
    
    initializeElements() {
        this.tableInput = document.getElementById('table-input');
        this.loadTableBtn = document.getElementById('load-table');
        this.tableContainer = document.getElementById('table-container');
        this.tableTitle = document.getElementById('table-title');
        this.activeFiltersSpan = document.getElementById('active-filters');
        this.clearFiltersBtn = document.getElementById('clear-filters');
        this.tableHeader = document.getElementById('table-header');
        this.tableBody = document.getElementById('table-body');
        this.errorMessage = document.getElementById('error-message');
        this.loading = document.getElementById('loading');
    }
    
    bindEvents() {
        this.loadTableBtn.addEventListener('click', () => this.loadTable());
        this.tableInput.addEventListener('keypress', (e) => {
            if (e.key === 'Enter') this.loadTable();
        });
        this.clearFiltersBtn.addEventListener('click', () => this.clearAllFilters());
        window.addEventListener('hashchange', () => this.parseHashAndLoadData());
    }
    
    parseHashAndLoadData() {
        const hash = window.location.hash.substring(1);
        if (!hash) return;
        
        try {
            const params = new URLSearchParams(hash);
            const table = params.get('table');
            
            if (table) {
                this.currentTable = table;
                this.tableInput.value = table;
                
                // Parse filters (prefixed with "f_")
                this.currentFilters = {};
                for (const [key, value] of params) {
                    if (key.startsWith('f_')) {
                        const columnName = key.substring(2); // Remove "f_" prefix
                        this.currentFilters[columnName] = value;
                    }
                }
                
                this.fetchTableData();
            }
        } catch (error) {
            this.showError('Invalid URL format');
        }
    }
    
    updateHash() {
        const params = new URLSearchParams();
        params.set('table', this.currentTable);
        
        for (const [key, value] of Object.entries(this.currentFilters)) {
            if (value) {
                params.set('f_' + key, value); // Add "f_" prefix
            }
        }
        
        window.location.hash = params.toString();
    }
    
    loadTable() {
        const tableName = this.tableInput.value.trim();
        if (!tableName) {
            this.showError('Please enter a table name');
            return;
        }
        
        this.currentTable = tableName;
        this.currentFilters = {};
        this.updateHash();
    }
    
    async fetchTableData() {
        if (!this.currentTable) return;
        
        this.showLoading(true);
        this.hideError();
        
        try {
            const params = new URLSearchParams({
                table: this.currentTable
            });
            
            // Add filters with "f_" prefix
            for (const [key, value] of Object.entries(this.currentFilters)) {
                if (value) {
                    params.set('f_' + key, value);
                }
            }
            
            const response = await fetch(`query.php?${params}`);
            if (!response.ok) {
                throw new Error(`HTTP ${response.status}: ${response.statusText}`);
            }
            
            const data = await response.json();
            
            if (data.error) {
                throw new Error(data.error);
            }
            
            this.schema = data.schema;
            this.renderTable(data.schema, data.rows);
            this.updateActiveFilters();
            
        } catch (error) {
            this.showError('Failed to fetch table data: ' + error.message);
            this.tableContainer.style.display = 'none';
        } finally {
            this.showLoading(false);
        }
    }
    
    renderTable(schema, rows) {
        this.tableTitle.textContent = `Table: ${this.currentTable}`;
        
        // Create header with filter inputs
        this.tableHeader.innerHTML = '';
        const headerRow = document.createElement('tr');
        
        schema.forEach(column => {
            const th = document.createElement('th');
            th.innerHTML = `
                <div class="column-header">
                    <span class="column-name">${column.name}</span>
                    <input type="text" 
                           class="filter-input" 
                           data-column="${column.name}"
                           placeholder="Filter ${column.name}"
                           value="${this.currentFilters[column.name] || ''}" />
                </div>
            `;
            headerRow.appendChild(th);
        });
        
        this.tableHeader.appendChild(headerRow);
        
        // Add event listeners to filter inputs
        this.tableHeader.querySelectorAll('.filter-input').forEach(input => {
            input.addEventListener('keypress', (e) => {
                if (e.key === 'Enter') {
                    this.applyFilter(e.target.dataset.column, e.target.value);
                }
            });
        });
        
        // Create data rows
        this.tableBody.innerHTML = '';
        rows.forEach(row => {
            const tr = document.createElement('tr');
            schema.forEach(column => {
                const td = document.createElement('td');
                td.textContent = row[column.name] || '';
                tr.appendChild(td);
            });
            this.tableBody.appendChild(tr);
        });
        
        this.tableContainer.style.display = 'block';
    }
    
    applyFilter(columnName, value) {
        if (value.trim()) {
            this.currentFilters[columnName] = value.trim();
        } else {
            delete this.currentFilters[columnName];
        }
        
        this.updateHash();
    }
    
    clearAllFilters() {
        this.currentFilters = {};
        this.updateHash();
    }
    
    updateActiveFilters() {
        const filterEntries = Object.entries(this.currentFilters);
        if (filterEntries.length === 0) {
            this.activeFiltersSpan.textContent = 'None';
        } else {
            this.activeFiltersSpan.textContent = filterEntries
                .map(([key, value]) => `${key}=${value}`)
                .join(', ');
        }
    }
    
    showError(message) {
        this.errorMessage.textContent = message;
        this.errorMessage.style.display = 'block';
    }
    
    hideError() {
        this.errorMessage.style.display = 'none';
    }
    
    showLoading(show) {
        this.loading.style.display = show ? 'block' : 'none';
    }
}

// Initialize the application when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    new SQLiteViewer();
});