function addCellHeader(table) {
	if (!table) {
		return false;
	}

	var trs = table.getElementsByTagName('tr');
	var trsChild;
	var grid = {};
	var cells;
	for (var i = 0, cntI = trs.length; i < cntI; i++) {
		if (!grid[i]) {
			grid[i] = {};
		}
		trsChild = trs.item(i).childNodes;
		cells = 0;
		for (var j = 0, cntJ = trsChild.length; j < cntJ; j++) {
			if (trsChild[j].nodeType == 1) {
				grid[i][cells++] = trsChild[j];
			}
		}
	}   
	var cellHeader = '';
	for (row in grid) {
		if (row == 0) {
			continue;
		}
		for (cell in grid[row]) {
cellHeader =  grid[0][cell].innerHTML;
			grid[row][cell].setAttribute('data-cell-header', cellHeader);
		}
	}
}
addCellHeader(document.querySelector('.afternoon-session'));