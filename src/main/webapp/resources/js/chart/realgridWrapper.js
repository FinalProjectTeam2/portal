var RealGridWrapper = function (uiObjName, fieldObj, columnObj, gridDataObj) {
	//공통 정의로 바꾸면 된다.
	var gridStyle = {
			"grid":{
				"fontFamily":"Lato, Noto Sans KR, sans-serif",
				"fontSize":"13"
			},
			"panel":{
				"background":"#fcfcfc",
				"paddingTop": "12",
				"paddingBottom": "12",
				"paddingLeft": "12",
				"borderBottom":"#333333,1",
			},
			"fixed": {
				background: "#fffcfcfc",
				colBar: {background:"#ffff0000"}
			},
			"header":{
				"background":"linear,#f5f5f5",
				"paddingBottom": "10",
				
		        "paddingTop": "15",
		        "borderBottom":"#e0e0e0,1",
		        "borderLeft": "#e0e0e0,0",
		        "borderRight": "#e0e0e0,1",
		        "selectedBackground": "linear,#eeeeee",
		        "foreground": "#333333",
		        "selectedForeground": "#747474",
		        group:{background:"linear,#f5f5f5",
		        	"paddingBottom": "10",
					
			        "paddingTop": "15",
			        "borderBottom":"#e0e0e0,1",
			        "borderLeft": "#e0e0e0,0",
			        "borderRight": "#e0e0e0,1",
			        "selectedBackground": "linear,#eeeeee",
			        "foreground": "#333333"}
			},
			"checkBar":{
				"borderBottom":"#e0e0e0,1",
		        "borderLeft": "#e0e0e0,0",
		        "borderRight": "#e0e0e0,1",
		        "figureBackground": "#1c66b1",
				"head":{
					"figureBackground": "#1c66b1"
				}
			},
			"body":{
				"fontBold": "false",
				"paddingBottom": "10",
		        "paddingTop": "10",
		        "paddingLeft": "10",
		        "foreground": "#747474",
		        "empty": { 
		        		"background": "#FFFFFFFF"
		        	   ,"foreground": "#FFFF8888"
		        	   ,"textAlignment": "center"
		        	   ,"lineAlignment": "center"
		        	   ,"fontSize": 20
		        	   ,"fontBold": true 
		        	   }
			},
			"stateBar":{
				"borderBottom":"#e0e0e0,1",
		        "borderLeft": "#e0e0e0,0",
		        "borderRight": "#e0e0e0,1"
			},
			"indicator":{
				"background":"#ffffff",
				"selectedBackground": "#f3f6fd",
				"selectedForeground": "#333333",
				"inactiveBackground": "#333333",
				"foreground": "#747474",
				"borderBottom":"#e0e0e0,1",
		        "borderLeft": "#e0e0e0,0",
		        "borderRight": "#e0e0e0,1",
		        
			},
			"rowGroup":{
				"header":{
					"background":"#f5f5f5",
					"foreground": "#747474",
					"figureBackground": "#747474",
					"paddingLeft":"10"
				},
				"headerBar":{
					"foreground": "#747474",
					"figureBackground": "#747474"
				},
				"bar":{
					"background":"#f5f5f5",
					"foreground": "#747474",
					"figureBackground": "#747474"
				},
				"panel":{
					"background": "#ffffff",
					"paddingBottom":"10",
					"paddingLeft":"10",
					"paddingRight":"10",
					"paddingTop":"15"
				},
				"footer":{
					"background":"#f5f5f5"
				}
				
			},
			"footer":{
				"background":"#ffffff",
				"borderTop": "#e0e0e0,1",
				//"borderBottom":"#e0e0e0,1",
		        "borderLeft": "#e0e0e0,0",
		        "borderRight": "#e0e0e0,1"
			}
	};
	
	RealGridJS.setRootContext("/scripts");
	var dataProvider = new RealGridJS.LocalDataProvider();
	dataProvider.setFields(fieldObj);
	var gridView = new RealGridJS.GridView(uiObjName);
    gridView.setColumns(columnObj);
    gridView.setDataSource(dataProvider);    
    gridView.setStyles(gridStyle);
    // status바를 표시하지 않음
    gridView.setStateBar({
    	  visible: false  
    	});
    // checkBar을 표시하지 않음
    gridView.setCheckBar({
    	  visible: false  
    	});
    // footer(합계)를 표시하지 않음
    gridView.setFooter({
        visible: false
    });
    gridView.setGroupingOptions({
    //    prompt: "열 제목을 이 곳으로 끌어다 놓으면 열 제목별로 그룹핑할 수 있습니다." 
    	prompt: "열 제목을 이 곳으로 끌어다 놓으면 열 제목별로 묶음 조회할 수 있습니다."
    });
    gridView.setRowGroup({
    	headerStatement: "$" + "{columnHeader}" + ": " + "$" + "{groupValue} - " + "$" + "{rowCount} 개",
    	expandedAdornments : "header"
    	});
    gridView.setDisplayOptions({
    	fitStyle: "evenFill",
	    showEmptyMessage: true,
	    emptyMessage: "조회된 데이터가 없습니다."
	});
    
    gridView.setFilteringOptions({
  	  clearWhenSearchCheck:true, 
  	  selector: {
  	    showSearchInput: true,       
  	    showButtons:true,              
  	    acceptText: "확인",
  	    cancelText: "취소"
  	  }
  	});
    
    dataProvider.fillJsonData(gridDataObj, {fillMode: "set"});
    
    this.getDataProvider = function() {
    	return dataProvider;
    }
    
    this.getGridView = function() {
    	return gridView;
    }
}
// 2019.07.26 정래경 작성
var RealGridTreeWrapper = function (uiObjName, fieldObj, columnObj, gridDataObj) {
	// 공통 스타일.
//	gridView.setStyles(basicBlueSkin)
	var treeGridStyle = {
			"grid":{
				"fontFamily":"Lato, Noto Sans KR, sans-serif",
				"fontSize":"13"
			},
			"panel":{
				"background":"#fcfcfc",
				"paddingTop": "12",
				"paddingBottom": "12",
				"paddingLeft": "12",
				"borderBottom":"#333333,1",
			},
			"header":{
				"background":"linear,#f5f5f5",
				"paddingBottom": "10",
		        "paddingTop": "15",
		        "borderBottom":"#e0e0e0,1",
		        "borderLeft": "#e0e0e0,0",
		        "borderRight": "#e0e0e0,1",
		        "selectedBackground": "linear,#eeeeee",
		        "foreground": "#333333",
		        "selectedForeground": "#747474"
			}, 
			"checkBar":{
				"borderBottom":"#e0e0e0,1",
		        "borderLeft": "#e0e0e0,0",
		        "borderRight": "#e0e0e0,1",
		        "figureBackground": "#1c66b1",
				"head":{
					"figureBackground": "#1c66b1"
				}
			},
			"body":{
				"fontBold": "false",
				"paddingBottom": "10",
		        "paddingTop": "10",
		        "paddingLeft": "10",
		        "foreground": "#747474"
			},
			"stateBar":{
				"borderBottom":"#e0e0e0,1",
		        "borderLeft": "#e0e0e0,0",
		        "borderRight": "#e0e0e0,1"
			},
			"indicator":{
				"background":"#ffffff",
				"selectedBackground": "#f3f6fd",
				"selectedForeground": "#333333",
				"inactiveBackground": "#333333",
				"foreground": "#747474",
				"borderBottom":"#e0e0e0,1",
		        "borderLeft": "#e0e0e0,0",
		        "borderRight": "#e0e0e0,1",
		        
			},
			"rowGroup":{
				"header":{
					"background":"#f5f5f5",
					"foreground": "#747474",
					"figureBackground": "#747474",
					"paddingLeft":"10"
				},
				"headerBar":{
					"foreground": "#747474",
					"figureBackground": "#747474"
				},
				"bar":{
					"background":"#f5f5f5",
					"foreground": "#747474",
					"figureBackground": "#747474"
				},
				"panel":{
					"background": "#ffffff",
					"paddingBottom":"10",
					"paddingLeft":"10",
					"paddingRight":"10",
					"paddingTop":"15"
				},
				"footer":{
					"background":"#f5f5f5"
				}
				
			},
			"footer":{
				"background":"#ffffff",
				"borderTop": "#e0e0e0,1",
				//"borderBottom":"#e0e0e0,1",
		        "borderLeft": "#e0e0e0,0",
		        "borderRight": "#e0e0e0,1"
			}
	};
	
	RealGridJS.setRootContext("/scripts");
	var dataProvider = new RealGridJS.LocalTreeDataProvider();
	dataProvider.setFields(fieldObj);
	
	var treeView = new RealGridJS.TreeView(uiObjName);
	
	treeView.setDataSource(dataProvider);
	treeView.setColumns(columnObj);
	treeView.setStyles(treeGridStyle);		

	dataProvider.setRows(gridDataObj, "tree", false);	// 데이터 적용

    this.getDataProvider = function() {
    	return dataProvider;
    }
    
    this.getTreeView = function() {
    	return treeView;
    }
}

/***********************************************************************
함수명 : gnf_realGrid_filter
설 명 : 
인 자 : pGridView    - realGrid의 GridView 
      pDataProvider - realGrid의 DataProvider
      pFilterColumn - filter를 할 컬럼
사용법 : gnf_realGrid_filter(pGridView, pDataProvider, pFilterColumn)
작성일 : 2019-07-30
작성자 : 정래경
수정일       수정자    수정내용
------     ------ -------------------
2019.07.30 정래경    최초생성
***********************************************************************/
function gnf_realGrid_filter(pGridView,pDataProvider,pFilterColumn){
	
	for(j=0; j < pFilterColumn.length; j++){
		var distinctValues = pDataProvider.getDistinctValues(pFilterColumn[j]);
		var filters = [];
		for(var i = 0; i < distinctValues.length; i++){
		    filters.push({name:distinctValues[i],criteria:"value = " + "'" + distinctValues[i] + "'"});
		}
		pGridView.setColumnFilters(pFilterColumn[j],filters);
	}
	// 필터에 CSS 스타일 적용 여부 설정
	pGridView.setFilteringOptions({
		selector: {
					useCssStyle: true
				  }
	});
	
//	// filter 변경 이벤트를 추가해준다.
	pGridView.onFilteringChanged = function (grid, column){
//	    alert(column.name + "필터가 변경됨");
//	    $("#page_cnt").html(data.resultList.length);
	}
}
/***********************************************************************
함수명 : gnf_realGrid_columnFix
설 명 : 
인 자 : pGridView    - realGrid의 GridView 
      pColCount - realGrid에서 열고정할 순번
사용법 : gnf_realGrid_columnFix(pGridView, pColCount)
작성일 : 2019-07-30
작성자 : 정래경
수정일       수정자    수정내용
------     ------ -------------------
2019.07.31 정래경    최초생성
***********************************************************************/
function gnf_realGrid_columnFix(pGridView,pColCount){
	pGridView.setFixedOptions({
		  colCount: pColCount,
		  colBarWidth : 1
		});
}

/***********************************************************************
 함수명 : gnf_realGrid_editableYn
 설 명 :
 인 자 : pGridView    - realGrid의 GridView
 pEditableYn - boolean type 으로 true, false 넘긴다.
 사용법 : gnf_realGrid_editableYn(pGridView, pEditableYn)
 작성일 : 2019-12-06
 작성자 : 김수진
 수정일       수정자    수정내용
 ------     ------ -------------------
 2019.12.06 김수진    최초생성
 ***********************************************************************/
function gnf_realGrid_editableYn(pGridView, pEditableYn){
	pGridView.setEditOptions({
		editable: pEditableYn
	});
}

