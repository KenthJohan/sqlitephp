<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SQLite Database Viewer</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h1>SQLite Database Viewer</h1>
        <div id="table-selector">
            <label for="table-input">Table Name:</label>
            <input type="text" id="table-input" placeholder="Enter table name" />
            <button id="load-table">Load Table</button>
        </div>
        
        <div id="table-container" style="display: none;">
            <h2 id="table-title"></h2>
            <div class="filters-info">
                <span>Active filters: <span id="active-filters">None</span></span>
                <button id="clear-filters">Clear All Filters</button>
            </div>
            <div class="table-wrapper">
                <table id="data-table">
                    <thead id="table-header"></thead>
                    <tbody id="table-body"></tbody>
                </table>
            </div>
        </div>
        
        <div id="error-message" class="error"></div>
        <div id="loading" class="loading" style="display: none;">Loading...</div>
    </div>
    <script src="main.js"></script>
</body>
</html>
