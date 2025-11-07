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
    
    getInputTypeForColumn(columnType) {
        const type = columnType.toUpperCase();
        
        // Map SQLite types to HTML input types
        if (type.includes('INT')) {
            return { type: 'number', step: '1' };
        }
        if (type.includes('REAL') || type.includes('FLOAT') || type.includes('DOUBLE') || type.includes('NUMERIC')) {
            return { type: 'number', step: 'any' };
        }
        if (type.includes('DATE')) {
            return { type: 'date' };
        }
        if (type.includes('TIME')) {
            return { type: 'datetime-local' };
        }
        if (type.includes('BOOL')) {
            return { type: 'text' }; // We'll handle boolean as text with suggestions
        }
        // Default to text for TEXT, BLOB, VARCHAR, etc.
        return { type: 'text' };
    }

    renderTable(schema, rows) {
        this.tableTitle.textContent = `Table: ${this.currentTable}`;
        
        // Create header with filter inputs
        this.tableHeader.innerHTML = '';
        const headerRow = document.createElement('tr');
        
        schema.forEach(column => {
            const th = document.createElement('th');
            const inputConfig = this.getInputTypeForColumn(column.type || 'TEXT');
            
            let inputAttributes = `type="${inputConfig.type}"`;
            if (inputConfig.step) {
                inputAttributes += ` step="${inputConfig.step}"`;
            }
            
            // Add specific attributes for boolean columns
            let datalistHtml = '';
            if (column.type && column.type.toUpperCase().includes('BOOL')) {
                datalistHtml = `
                    <datalist id="bool-options-${column.name}">
                        <option value="1">
                        <option value="0">
                        <option value="true">
                        <option value="false">
                        <option value="yes">
                        <option value="no">
                    </datalist>`;
                inputAttributes += ` list="bool-options-${column.name}"`;
            }
            
            th.innerHTML = `
                <div class="column-header">
                    <span class="column-name">${column.name}</span>
                    <span class="column-type">${column.type || 'Unknown'}</span>
                    <input ${inputAttributes}
                           class="filter-input" 
                           data-column="${column.name}"
                           placeholder="Filter ${column.name}"
                           value="${this.currentFilters[column.name] || ''}" />
                    ${datalistHtml}
                </div>
            `;
            headerRow.appendChild(th);
        });
        
        this.tableHeader.appendChild(headerRow);
        
        // Create modification row with update inputs
        const modifyRow = document.createElement('tr');
        modifyRow.className = 'modify-row';
        
        schema.forEach((column, index) => {
            const th = document.createElement('th');
            const inputConfig = this.getInputTypeForColumn(column.type || 'TEXT');
            
            let inputAttributes = `type="${inputConfig.type}"`;
            if (inputConfig.step) {
                inputAttributes += ` step="${inputConfig.step}"`;
            }
            
            // Add specific attributes for boolean columns
            let datalistHtml = '';
            if (column.type && column.type.toUpperCase().includes('BOOL')) {
                datalistHtml = `
                    <datalist id="update-bool-options-${column.name}">
                        <option value="1">
                        <option value="0">
                        <option value="true">
                        <option value="false">
                        <option value="yes">
                        <option value="no">
                    </datalist>`;
                inputAttributes += ` list="update-bool-options-${column.name}"`;
            }
            
            // For the last column, add the update button alongside the input
            if (index === schema.length - 1) {
                th.innerHTML = `
                    <div class="modify-header">
                        <small>Update ${column.name}:</small>
                        <div style="display: flex; gap: 5px;">
                            <input ${inputAttributes}
                                   class="update-input" 
                                   data-column="${column.name}"
                                   placeholder="New value"
                                   style="flex: 1;" />
                            <button class="update-btn" id="apply-updates" style="width: auto; padding: 4px 8px;">
                                Update
                            </button>
                        </div>
                        ${datalistHtml}
                    </div>
                `;
            } else {
                th.innerHTML = `
                    <div class="modify-header">
                        <small>Update ${column.name}:</small>
                        <input ${inputAttributes}
                               class="update-input" 
                               data-column="${column.name}"
                               placeholder="New value" />
                        ${datalistHtml}
                    </div>
                `;
            }
            modifyRow.appendChild(th);
        });
        
        this.tableHeader.appendChild(modifyRow);
        
        // Add event listeners to filter inputs
        this.tableHeader.querySelectorAll('.filter-input').forEach(input => {
            input.addEventListener('keypress', (e) => {
                if (e.key === 'Enter') {
                    this.applyFilter(e.target.dataset.column, e.target.value);
                }
            });
        });
        
        // Add event listener to update button
        const updateBtn = document.getElementById('apply-updates');
        if (updateBtn) {
            updateBtn.addEventListener('click', () => this.applyUpdates());
        }
        
        // Create data rows
        this.tableBody.innerHTML = '';
        rows.forEach(row => {
            const tr = document.createElement('tr');
            schema.forEach((column, columnIndex) => {
                const td = document.createElement('td');
                const cellValue = row[column.name] || '';
                td.textContent = cellValue;
                td.style.cursor = 'pointer';
                td.title = `Click to filter ${column.name} by "${cellValue}"`;
                
                // Add click event to set filter
                td.addEventListener('click', () => {
                    this.applyFilter(column.name, cellValue);
                });
                
                tr.appendChild(td);
            });
            this.tableBody.appendChild(tr);
        });
        
        this.tableContainer.style.display = 'block';
    }
    
    applyFilter(columnName, value) {
        // Convert value to string and trim if it's not null/undefined
        const stringValue = value != null ? String(value).trim() : '';
        
        if (stringValue) {
            this.currentFilters[columnName] = stringValue;
        } else {
            delete this.currentFilters[columnName];
        }
        
        this.updateHash();
    }
    
    async applyUpdates() {
        const updateInputs = this.tableHeader.querySelectorAll('.update-input');
        const updates = {};
        
        // Collect non-empty update values
        updateInputs.forEach(input => {
            const value = input.value.trim();
            if (value) {
                updates[input.dataset.column] = value;
            }
        });
        
        if (Object.keys(updates).length === 0) {
            this.showError('Please enter at least one value to update');
            return;
        }
        
        // Confirm the update operation
        const filterCount = Object.keys(this.currentFilters).length;
        const confirmMessage = filterCount > 0 
            ? `Are you sure you want to update all filtered rows matching: ${Object.entries(this.currentFilters).map(([k,v]) => `${k}=${v}`).join(', ')}?`
            : 'Are you sure you want to update ALL rows in this table?';
            
        if (!confirm(confirmMessage)) {
            return;
        }
        
        this.showLoading(true);
        this.hideError();
        
        try {
            const response = await fetch('update.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    table: this.currentTable,
                    updates: updates,
                    filters: this.currentFilters
                })
            });
            
            if (!response.ok) {
                throw new Error(`HTTP ${response.status}: ${response.statusText}`);
            }
            
            const result = await response.json();
            
            if (result.error) {
                throw new Error(result.error);
            }
            
            // Show success message
            alert(`Success: ${result.message}`);
            
            // Clear update inputs
            updateInputs.forEach(input => input.value = '');
            
            // Reload table data to show updated values
            await this.fetchTableData();
            
        } catch (error) {
            this.showError('Failed to update rows: ' + error.message);
        } finally {
            this.showLoading(false);
        }
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