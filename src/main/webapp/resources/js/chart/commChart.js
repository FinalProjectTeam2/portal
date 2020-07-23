/*
	3D 단일 막대 그래프 	: makeColumnChart(title, subTitle, color, chartId, divId, categoryField, yField, chartData)
	라인 그래프                	: makeLineChart(title, subTitle, color, chartId, divId, categoryField, yField, chartData)
	파이 그래프			: makePieChart(title, subTitle, color, chartId, divId, categoryField, yField, chartData)
	레이더 그래프			: makeRadarChart(title, subTitle, color, chartId, divId, categoryField, yField, displayName, chartData)
	3D 멀티 막대 그래프 	: makeColumnMultiChart(title, subTitle, color, chartId, divId, categoryField, yField, displayName, chartData)
	바 그래프     			: makeBarChart(title, subTitle, color, chartId, divId, categoryField, yField, chartData)
	라인 멀티 그래프         	: makeLineMultiChart(title, subTitle, color, chartId, divId, color, categoryField, yField, displayName, chartData)
	3D 막대 + 라인 그래프	: makeCombinationChart(title, subTitle, color, chartId, divId, categoryField, yField, displayName, chartData)
	도넛 그래프			: makeDoughnutChart(title, subTitle, color, chartId, divId, categoryField, yField, chartData)
	게이지 그래프			: makeGaugeCircularGradientChart(title, subTitle, color, chartId, divId, categoryField, yField, chartData)
	맵 차트 			: makeMapChart(chartId, chartData)
	반복이미지 그래프		: makeImageRepeatChart(title, subTitle, color, chartId, divId, categoryField, yField, chartData)
	버블 맵 그래프 			: makeBubbleMapChart(chartId, chartData)
	패턴막대그래프			: makePatternColumnChart(title, subTitle, color, chartId, divId, categoryField, yField, chartData)
	단일이미지 그래프		: makeLineMultiDualChart(title, subTitle, color, chartId, divId, categoryField, yField, displayName, chartData){
	라인멀티듀얼축 그래프		: makeLineMultiDualChart(title, subTitle, color, chartId, divId, categoryField, yField, displayName, chartData)
	
	Parameter
	 title : 차트 제목
	 subtitle : 차트 부제목
	 color : 막대 및 라인 컬러
	 charId : rMateChartH5.create에 대입한 차트아이디
	 divId : 실제 차트가 구현 될 div 아이디
	 categoryField : x축 컬럼명(소문자)
	 yField : y축 컬럼명(소문자)
	 chartData : DB에서 조회한 데이터
	

	
*/

function makeColumnChart(chartId, categoryField, yField, chartData, unit, color){
	
	var yUnit = "";
	
	if( unit == null || unit == "" ){
		unit ="";
	}else{
		yUnit = unit.split(":")[1].split(")")[0].replace(/\s/gi, "");
	}
	
	var layoutStr = '<rMateChart backgroundColor="0xFFFFFF"  cornerRadius="12" borderStyle="solid">'
			  +'		<Options>'
			  +'			<SubCaption text="'+unit+'" textAlign="right"/>' //단위 
			  +'		</Options>'
			  +'		 <CurrencyFormatter id="fmt" currencySymbol="('+ yUnit +')" alignSymbol="right"/>'
	          +' 	<NumberFormatter id="numFmt" precision="1" rounding="nearest" useThousandsSeparator="true"/>' 
	          +' 	<Column2DChart showDataTips="true" dataTipFormatter="{numFmt}" >' 
	          +'  		<horizontalAxis>' 
	          +'   			<CategoryAxis categoryField="'+ categoryField +'" />' 
	          +'  		</horizontalAxis>'
	          +'  		<verticalAxis>'
	          +'  			<LinearAxis id="vAxis" formatter="{fmt}" />'
	          +'  		</verticalAxis>'
	          +'  		<series>' 
	          +'   			<Column2DSeries labelPosition="inside" formatter="{numFmt}" yField="'+ yField +'" styleName="seriesStyle" >' 
	          +'    			<showDataEffect>' 
	          +'    					<SeriesInterpolate/>' 
	          +'    			</showDataEffect>' 
	          +' <fill>                                 	' 
	          +' <SolidColor color="'+color+'" alpha="1"/>	' 
	          +' </fill>                                	' 
	          +' <stroke>                               	' 
	          +' <Stroke color="'+color+'" weight="1"/>   	' 
	          +' </stroke>                              	' 
	          +'   			</Column2DSeries>' 
	          +'  		</series>'
	          +' 	</Column2DChart>' 
	          +'<Style>'
              +'.seriesStyle {labelPosition:inside;fontSize:11;color:#ffffff;}'
         +'</Style>'
	          +'</rMateChart>'; 
	
	  
	 return layoutStr;
}

function makeLineChart(chartId, visi, categoryField, yField, chartData, unit){
	
	var yUnit = "";
	
	if( unit == null || unit == "" ){
		unit ="";
	}else{
		yUnit = unit.split(":")[1].split(")")[0].replace(/\s/gi, "");
	}
	
	// 스트링 형식으로 레이아웃 정의.
	var layoutStr = '<rMateChart backgroundColor="#FFFFFF"  borderThickness="1" borderStyle="none">'
		+'<Options>'
		        +'<SubCaption text="'+ unit +'" textAlign="right" />'
		 +'</Options>'	 
		 +'		 <CurrencyFormatter id="fmt" currencySymbol="('+ yUnit +')" alignSymbol="right"/>'
		+'<NumberFormatter id="numFmt" precision="1" rounding="nearest" useThousandsSeparator="true"/>'
	       +'<Line2DChart showDataTips="true" dataTipDisplayMode="axis" paddingTop="0" dataTipFormatter="{numFmt}">'
	         +'<horizontalAxis>'
	               +'<CategoryAxis categoryField="'+ categoryField +'"/>'
	          +'</horizontalAxis>'
	          +'<verticalAxis>'
		         +'	<LinearAxis id="vAxis" formatter="{fmt}"/>'
				 +'</verticalAxis>'
				 +'<verticalAxisRenderers>' 
			        +'	<Axis2DRenderer axis="{vAxis}" visible="'+visi+'"/>' 
			        +'</verticalAxisRenderers>'  
				 +'<series>'
	               +'<Line2DSeries labelPosition="up" formatter="{numFmt}" yField="'+ yField +'" form="segment"  dashLinePattern="2" itemRenderer="RectangleItemRenderer" radius="6">'
	               +'<fills>'
	                  +'	<SolidColor color="0x316a9d"/>'					// fills : itemRenderer의 안쪽의 공백의 채우기 색상 입니다. 
	                  +'	<SolidColor color="0xffca9b"/>'
	                  +'	<SolidColor color="0xff66cc"/>'
	                  +'</fills>'  
	               	+'<showDataEffect>'
	                       + '<SeriesClip duration="1000"/>'
	                 +'</showDataEffect>'
	              +'</Line2DSeries>'
	            +'</series>'
	          +'<annotationElements>'
	               +'<CrossRangeZoomer enableZooming="false" horizontalLabelFormatter="{numFmt}" horizontalStrokeEnable="false"/>'
	           +'</annotationElements>'
	      +'</Line2DChart>'
	 +'</rMateChart>';
	
	
	return layoutStr;
	 
}
function makeLineChartColor(chartId, visi, categoryField, yField, chartData ,bgColor,unit){
	
	var yUnit = "";
	
	if( unit == null || unit == "" ){
		unit ="";
	}else{
		yUnit = unit.split(":")[1].split(")")[0].replace(/\s/gi, "");
	}
	
	// 스트링 형식으로 레이아웃 정의.
	var layoutStr = '<rMateChart backgroundColor="'+bgColor+'"  borderThickness="1" borderStyle="none">'
		+'<Options>'
		        +'<SubCaption text="'+ unit +'" textAlign="right" />'
		 +'</Options>'	 
		 +'		 <CurrencyFormatter id="fmt" currencySymbol="('+ yUnit +')" alignSymbol="right"/>'
		+'<NumberFormatter id="numFmt" precision="1" useThousandsSeparator="true"/>'
	       +'<Line2DChart showDataTips="true" dataTipDisplayMode="axis" paddingTop="0" dataTipFormatter="{numFmt}" displayCompleteCallFunction="displayCallFunction">'
	         +'<horizontalAxis>'
	               +'<CategoryAxis categoryField="'+ categoryField +'"/>'
	          +'</horizontalAxis>'
	          +'<verticalAxis>'
		         +'	<LinearAxis id="vAxis" formatter="{fmt}"/>'
				 +'</verticalAxis>'
	            +'<series>'
	               +'<Line2DSeries labelPosition="up" yField="'+ yField +'" form="segment"  dashLinePattern="2" itemRenderer="RectangleItemRenderer" radius="6">'
	               +'<fills>'
	                  +'	<SolidColor color="0x316a9d"/>'					// fills : itemRenderer의 안쪽의 공백의 채우기 색상 입니다. 
	                  +'	<SolidColor color="0xffca9b"/>'
	                  +'	<SolidColor color="0xff66cc"/>'
	                  +'</fills>'  
	               	+'<showDataEffect>'
	                       + '<SeriesClip duration="1000"/>'
	                 +'</showDataEffect>'
	              +'</Line2DSeries>'
	            +'</series>'
	          +'<annotationElements>'
	               +'<CrossRangeZoomer enableZooming="false" horizontalLabelFormatter="{numFmt}" horizontalStrokeEnable="false"/>'
	           +'</annotationElements>'
	      +'</Line2DChart>'
	 +'</rMateChart>';
	
	return layoutStr;
	
}

function makePieChart(chartId, categoryField, yField, chartData,unit){
	if( unit == null || unit == "" ){
		unit ="";
	}
	var layoutStr = 
        '<rMateChart backgroundColor="#FFFFFF"  borderStyle="none">'
		  +'	<Options>'
		  +'		<SubCaption text="'+unit+'" textAlign="right" />' //단위 
		  +'		<Legend useVisibleCheck="true"/>'
		  +'	</Options>'     
         +'<NumberFormatter id="numFmt"/>'
         /* 
         Pie3D 차트 생성시에 필요한 Pie3DChart 정의합니다 
         showDataTips : 데이터에 마우스를 가져갔을 때 나오는 Tip을 보이기/안보이기 속성입니다.  
          */
          +'<Pie2DChart showDataTips="true"  depth="50" >'
               +'<series>'
               // 파이에 색상을 주고 싶으면 fillJsFunction="fillJsFunc"을 추가
                   +'<Pie2DSeries nameField="'+ categoryField +'" field="'+ yField +'" labelPosition="inside" color="#ffffff"  startAngle="120" >'
                    /* Pie3DChart 정의 후 Pie3DSeries labelPosition="inside"정의합니다 */
                       +'<showDataEffect>'
                           /* 차트 생성시에 Effect를 주고 싶을 때 shoDataEffect정의합니다 */
                            +'<SeriesInterpolate duration="1000"/>'
                           /* 
                         SeriesSlide 효과는 시리즈 데이터가 데이터로 표시될 때 한쪽에서 미끄러지듯 나타나는 효과를 적용합니다
                           - 공통 -                      
                            elementOffset : effect를 지연시키는 시간을 지정합니다 default:20
                          minimumElementDuration : 각 엘리먼트의 최소 지속 시간을 설정합니다 default:0
                          		이 값보다 짧은 시간에 effect가 실행되지 않습니다
                         offset : effect개시의 지연시간을 설정합니다 default:0
                            perElementOffset : 각 엘리먼트의 개시 지연시간을 설정합니다
                           - SeriesSlide -
                         direction : left:왼쪽, right:오른쪽, up:위, down:아래 default는 left입니다
                          */
                      +'</showDataEffect>'
                  +'</Pie2DSeries>'
             +'</series>'
          +'</Pie2DChart>'
      +'</rMateChart>';
	
	return layoutStr;
	 
}
/*
레이더  차트
data : 실제 표기될 data (json 형식)
color : 막대에 표시할 색상( 색상표 형식의 배열 ex. ["#3300FF", "#990033", "#00FFCC"];) 없을경우 기본색상으로 들어간다.
legendClick : 범례에 있는 체크박스 유무 (true, false)
legendPosition : 범례의 위치 (top, bottom, left, right)
groupId : 그룹으로 묶을 ID (배열)
displayName : 범례와 데이터팁에 표시될 이름(배열)
dataTipVisible : 데이터팁 표시유무(true, false)
legendVisible : 범례 표시유무 (true, false)
chartId : 차트의 id
max : 축 최대값(0이면 자동)

maximum="5" 사립대학재정지표 맥스값 "5"로 고정
*/
function makeRadarChart(title, subTitle, data , legendClick, legendPosition, groupId, categoryField, displayName, dataTipVisible, legendVisible, chartId, max ,unit){

	chartData = data;
	layoutStr = '<rMateChart backgroundColor="0xFFFFFF" cornerRadius="12" borderStyle="none">'
	layoutStr +=	'<Options>'
	layoutStr +=		'<Caption text="'+title+'" fontFamily="맑은 고딕"/>';
					if(legendVisible ){
	layoutStr +=		'<Legend useVisibleCheck="'+legendClick+'" defaultMouseOverAction="'+legendClick+'" fontFamily="맑은 고딕" position="'+legendPosition+'" />';
					}
					if( subTitle.length > 0 ){
	layoutStr +=		'<SubCaption text="'+unit+'" styleName="subCaptionStyle" font-weight="bold" textAlign="right"/>'; 
					}					
	layoutStr +=	'</Options>'
					+'<RadarChart id="chart1" isSeriesOnAxis="true" type="polygon" paddingTop="20" paddingBottom="20" showDataTips="'+dataTipVisible+'"  >'
				/*  
				Radar 차트 생성시에 필요한 RadarChart 정의합니다 
				showDataTips : 데이터에 마우스를 가져갔을 때 나오는 Tip을 보이기/안보이기 속성입니다.
				isSeriesOnAxis : 차트 시리즈가 radialAxis위에 표현될지 여부를 나타냅니다
				type - circle, polygon : Rader차트의 타입(원형, 다각형)입니다 
				이 예제에서는 polygon입니다
				*/
							+'<radialAxis>';
	if(max > 0){
		layoutStr +='<LinearAxis id="rAxis" maximum="'+ max +'"/>';
	}else{
		layoutStr +='<LinearAxis id="rAxis"/>';
	}
				layoutStr +='</radialAxis>'				
							+'<angularAxis>';
							if(title.substring(title.length-4,title.length) == "2015"){
								layoutStr +='<CategoryAxis id="aAxis" categoryField="'+categoryField+'" displayName="Category" labelJsFunction="labelFunc2"/>';
							}
							else{
								layoutStr +='<CategoryAxis id="aAxis" categoryField="'+categoryField+'" displayName="Category" labelJsFunction="labelFunc3"/>';
							}
							layoutStr +='</angularAxis>'				 
							+'<radialAxisRenderers>'
							 /* radialAxis렌더러 정의 */
							 /* 가로, 세로축 모두 표시 */
								+'<Axis2DRenderer axis="{rAxis}" horizontal="true" visible="true" tickPlacement="outside" tickLength="4">'
									+'<axisStroke>'
										+'<Stroke color="#555555" weight="1"/>'
									+'</axisStroke>'
								+'</Axis2DRenderer>'
								+'<Axis2DRenderer axis="{rAxis}" horizontal="false" visible="false" tickPlacement="outside" tickLength="4">'
									+'<axisStroke>'
										+'<Stroke color="#555555" weight="1"/>'
									+'</axisStroke>'
								+'</Axis2DRenderer>'
							+'</radialAxisRenderers>'
							+'<angularAxisRenderers>'
								+'<AngularAxisRenderer axis="{aAxis}"/>'
							+'</angularAxisRenderers>'
						  +'<series>';
						for( var i = 0 ; i < groupId.length ; i++){
	layoutStr += 			'<RadarSeries field="'+groupId[i]+'" displayName="'+displayName[i]+'">';
	layoutStr += 				'<showDataEffect>';
	layoutStr += 					'<SeriesInterpolate/>';
	layoutStr += 				'</showDataEffect>';
	layoutStr +=			'</RadarSeries>';
						}
	layoutStr +=		  '</series>'
					+'</RadarChart>'
			+'</rMateChart>';

return layoutStr;


}
/*function makeRadarChart(title, subTitle, chartId, divId, categoryField, yField, displayName, chartData){

	var layoutStr = 
		'<rMateChart backgroundColor="0xFFFFFF" cornerRadius="12" borderStyle="none">'
			+'<Options>'
				+'<Caption text="'+ title +'" fontFamily="맑은 고딕"/>'
				+'<SubCaption text="'+ subTitle +'"/>'
				+'<Legend useVisibleCheck="true" defaultMouseOverAction="true" fontFamily="맑은 고딕"/>'
			+'</Options>'
			+'<RadarChart id="chart1" isSeriesOnAxis="true" type="polygon" paddingTop="20" paddingBottom="20" showDataTips="true">'
		  
		Radar 차트 생성시에 필요한 RadarChart 정의합니다 
		showDataTips : 데이터에 마우스를 가져갔을 때 나오는 Tip을 보이기/안보이기 속성입니다.
		isSeriesOnAxis : 차트 시리즈가 radialAxis위에 표현될지 여부를 나타냅니다
		type - circle, polygon : Rader차트의 타입(원형, 다각형)입니다 
		이 예제에서는 polygon입니다
		
					+'<radialAxis>'
						+'<LinearAxis id="rAxis"/>'
					+'</radialAxis>'				+'<angularAxis>'
						+'<CategoryAxis id="aAxis" categoryField="'+ categoryField +'" displayName="Category"/>'
					+'</angularAxis>'				 
					+'<radialAxisRenderers>'
					  radialAxis렌더러 정의 
					  가로, 세로축 모두 표시 
						+'<Axis2DRenderer axis="{rAxis}" horizontal="true" visible="true" tickPlacement="outside" tickLength="4">'
							+'<axisStroke>'
								+'<Stroke color="#555555" weight="1"/>'
							+'</axisStroke>'
						+'</Axis2DRenderer>'
						+'<Axis2DRenderer axis="{rAxis}" horizontal="false" visible="true" tickPlacement="outside" tickLength="4">'
							+'<axisStroke>'
								+'<Stroke color="#555555" weight="1"/>'
							+'</axisStroke>'
						+'</Axis2DRenderer>'
					+'</radialAxisRenderers>'
					+'<angularAxisRenderers>'
						+'<AngularAxisRenderer axis="{aAxis}"/>'
					+'</angularAxisRenderers>'
				  +'<series>';
for(var i = 0 ; i < yField.length ; i++){				  
	layoutStr +='<RadarSeries field="'+ yField[i] +'" displayName="'+ displayName[i] +'">'
					 RadarChart 정의 후 RadarSeries 정의합니다  
						+'<showDataEffect>'
								  차트 생성시에 Effect를 주고 싶을 때 shoDataEffect정의합니다 
							+'<SeriesInterpolate/>'
						  
						SeriesInterpolate는 시리즈 데이터가 새로운 시리즈 데이터로 표시될 때 이동하는 효과를 적용합니다 
						- 공통속성 -						
						elementOffset : effect를 지연시키는 시간을 지정합니다 default:20
						minimumElementDuration : 각 엘리먼트의 최소 지속 시간을 설정합니다 default:0
									 이 값보다 짧은 시간에 effect가 실행되지 않습니다
						offset : effect개시의 지연시간을 설정합니다 default:0
						perElementOffset : 각 엘리먼트의 개시 지연시간을 설정합니다
						
						+'</showDataEffect>'
					+'</RadarSeries>';	
}					
layoutStr +='</series>'
			+'</RadarChart>'
	+'</rMateChart>';
//차트 데이터
	
var chartData = [{"catName":"Food", "year2010":100, "year2011":100, "year2012":180, "year2013":150}
		,{"catName":"Health Care", "year2010":80, "year2011":120, "year2012":200, "year2013":210}
		,{"catName":"Transportation", "year2010":70, "year2011":115, "year2012":100, "year2013":240}
		,{"catName":"Clothing", "year2010":80, "year2011":120, "year2012":140, "year2013":210}
		,{"catName":"Education", "year2010":90, "year2011":160, "year2012":130, "year2013":200}
		,{"catName":"Shelter", "year2010":100, "year2011":180, "year2012":165, "year2013":140}
		,{"catName":"Leisure", "year2010":76, "year2011":120, "year2012":130, "year2013":170}
		,{"catName":"Others", "year2010":80, "year2011":140, "year2012":140, "year2013":190}];
	
	  
	 
}*/

function makeColumnMultiChart(chartId, categoryField, yField, displayName, chartData, unit, color){

	var yUnit = "";
	
	if( unit == null || unit == "" ){
		unit ="";
	}else{
		yUnit = unit.split(":")[1].split(")")[0].replace(/\s/gi, "");
	}

	var layoutStr = '<rMateChart backgroundColor="0xFFFFFF" cornerRadius="12" borderStyle="none">'
		+'<NumberFormatter id="numFmt" precision="0"/>'
		+'<Options>'
			+'<Legend defaultMouseOverAction="false" useVisibleCheck="true"/>'
			+'<SubCaption text="'+unit+'" textAlign="right" />' //단위 			
		+'</Options>'		
		+'		 <CurrencyFormatter id="fmt" currencySymbol="('+ yUnit +')" alignSymbol="right"/>'
		+' 	<NumberFormatter id="numFmt" precision="0" useThousandsSeparator="true"/>'
		+'<Column2DChart showDataTips="true" selectionMode="true" columnWidthRatio="0.65" >'
			+'<horizontalAxis>'
				+'<CategoryAxis categoryField="'+ categoryField +'"/>' 
			+'</horizontalAxis>'
			+'<verticalAxis>'
				+'<LinearAxis formatter="{fmt}" />'
			+'</verticalAxis>'
			+'<series>';
			/* Column3D Multi-Sereis 를 생성시에는 Column3DSeries 여러 개 정의합니다 */
	for(var i = 0 ; i < yField.length ; i++){					
		layoutStr += '<Column2DSeries labelPosition="outside" yField="'+ yField[i] +'" displayName="'+ displayName[i] +'" showValueLabels="[i]">'
					+'	<showDataEffect>'
					+'		<SeriesInterpolate/>' 
					+'	</showDataEffect>'
					+' <fill>                                 	' 
			          +' <SolidColor color="'+color[i]+'" alpha="1"/>	' 
			          +' </fill>                                	' 
			          +' <stroke>                               	' 
			          +' <Stroke color="'+color[i]+'" weight="1"/>   	' 
			          +' </stroke>                              	' 
					+'</Column2DSeries>';
	}
	layoutStr += '</series>'
		+'</Column2DChart>'
	+'</rMateChart>';
	
	return layoutStr;
	 
}

function makeBarChart(chartId, categoryField, yField, chartData,unit){
	if( unit == null || unit == "" ){
		unit ="";
	}	

	var layoutStr = 
		'<rMateChart backgroundColor="0xFFFFFF" cornerRadius="12" borderStyle="none">'
		+'<Options>'
			+'<SubCaption text="'+unit+'" textAlign="right" />' //단위 						
		+'</Options>'
			+'<Bar2DChart showDataTips="true" >'
				+'<horizontalAxis>'
					+'<LinearAxis />' //minimum="10000" maximum="50000" interval="5000"
				+'</horizontalAxis>'
				+'<verticalAxis>'
					+'<CategoryAxis categoryField="'+ categoryField +'"/>' 
				+'</verticalAxis>'
				+'<series>'
					+'<Bar2DSeries labelPosition="inside" xField="'+ yField +'" displayName="'+ yField +'"  color="#ffffff">'
					+'<showDataEffect>'
	                    +'<SeriesInterpolate/>'
	               +'</showDataEffect>'
					+'</Bar2DSeries>'
				+'</series>'
			+'</Bar2DChart>'
		+'</rMateChart>';
	
	return layoutStr;
	 
}

function makeLineMultiChart(chartId, categoryField, yField, displayName, chartData,unit){
	if( unit == null || unit == "" ){
		unit ="";
	}

	var layoutStr = 
		'<rMateChart cornerRadius="12" backgroundColor="0xffffff" borderStyle="none">'
		+'<Options>'
			+'<SubCaption text="'+unit+'" textAlign="right" />' //단위 
			+'<Legend defaultMouseOverAction="false" useVisibleCheck="true"/>'
		+'</Options>'
		+'<NumberFormatter id="numFmt" precision="0"/>'
		+'<Line2DChart showDataTips="true" dataTipDisplayMode="axis" paddingTop="0" >'
			+'<horizontalAxis>'
				+'<CategoryAxis categoryField="'+ categoryField +'"/>'
			+'</horizontalAxis>'
			+'<verticalAxis>'
				+'<LinearAxis />'
			+'</verticalAxis>'
			+'<series>';
	for(var i = 0 ; i < yField.length ; i++){	
				/* 
				itemRenderer는 Tip이 보여지는 영역차트 부분에 ItemRenderer에서 제공하는 모양을 그려줍니다
				이 예제에서는 Diamond입니다
				사용할 수 있는 도형을 모두 표현한 예제는 Chart Samples 의 범례 예제를 참고하십시오.
				*/
		layoutStr += '<Line2DSeries labelPosition="up" yField="'+yField[i]+'"  radius="5" displayName="'+displayName[i]+'" form="segment" lineStyle="dashLine" dashLinePattern="2" itemRenderer="RectangleItemRenderer">'
					/* 아이템렌더러(데이터 마커) 테두리 색상 */
					+'<showDataEffect>'
						+'<SeriesInterpolate/>'
					+'</showDataEffect>'
				+'</Line2DSeries>';
	}				
	layoutStr += '</series>'
			+'<annotationElements>'
				+'<CrossRangeZoomer zoomType="horizontal" fontSize="11" color="0xFFFFFF" horizontalLabelFormatter="{numFmt}" verticalLabelPlacement="bottom" horizontalLabelPlacement="left" enableZooming="false" enableCrossHair="true" backgroundColor="0xeb494a" borderColor="0xeb494a">'
				+'</CrossRangeZoomer>'
			+'</annotationElements>'
		+'</Line2DChart>'
	+'</rMateChart>';

//차트 데이터
	return layoutStr;
	  
	 
}

function makeCombinationChart(chartId, categoryField, yField, displayName, chartData,unit){
	if( unit == null || unit == "" ){
		unit ="";
	}
	var layoutStr = 
		'<rMateChart backgroundColor="0xFFFFFF" cornerRadius="12" borderStyle="none">'
			+'<Options>'
				+'<SubCaption text="'+unit+'" textAlign="right" />' //단위 
			+'</Options>'		
			+'<NumberFormatter id="numFmt" useThousandsSeparator="true" precision="0"/>'
			+'<Combination2DChart showDataTips="true" >'
		/*  
		Combination3D 차트 생성시에 필요한 Combination3DChart 정의합니다 
		showDataTips : 데이터에 마우스를 가져갔을 때 나오는 Tip을 보이기/안보이기 속성입니다  
		*/	
				+'<verticalAxis>'
					+'<LinearAxis id="vAxis1" formatter="{numFmt}" maximum="100000"/>'
				+'</verticalAxis>'
				+'<horizontalAxis>'
					+'<CategoryAxis categoryField="'+ categoryField +'"/>' 
				+'</horizontalAxis>'
				+'<series>'
					+'<Column2DSeries labelPosition="outside" selectable="true" yField="'+ yField[0] +'" displayName="'+ yField[0] +'">'
					+'	<fill>'
			        +'		<SolidColor color="'+ color[0] +'" alpha="1"/>' //color:색깔 alpha:투명도
			        +'	</fill>'
					+'<showDataEffect>'
						+'<SeriesInterpolate/>' 
					+'</showDataEffect>'
					+'</Column2DSeries>'
					+'<Line2DSeries labelPosition="up" selectable="true" yField="'+ yField[1] +'" displayName="'+ yField[1] +'" styleName="lineSeriesLabel" showValueLabels="[10]" form="segment" lineStyle="dashLine" dashLinePattern="2" itemRenderer="RectangleItemRenderer" radius="6">'
						+'<lineStroke>'										// lineStroke : 선에 대한 색상 입니다.
				        +'	<Stroke color="'+ color[1] +'" weight="2"/>'		
				        +'</lineStroke>'	
						+'<verticalAxis>'
							+'<LinearAxis id="vAxis2"/>'
						+'</verticalAxis>'
						+'<showDataEffect>'
							+'<SeriesInterpolate/>' 
						+'</showDataEffect>'
					+'</Line2DSeries>'
				+'</series>'
				+'<verticalAxisRenderers>'
					+'<Axis3DRenderer axis="{vAxis1}" showLine="true"/>'
					+'<Axis3DRenderer axis="{vAxis2}" showLine="true"/>'
				+'</verticalAxisRenderers>'
			+'</Combination2DChart>'
			+'<Style>'
				+'.lineSeriesLabel{'
					+'color:#777777;'
					+'fontWeight:normal;'
				+'}'
			+'</Style>'
		+'</rMateChart>';

//차트 데이터
/*chartData = [{"Month":"Jan","Profit":1000,"Cost":100,"Revenue":2300},
		{"Month":"Feb","Profit":1400,"Cost":140,"Revenue":1200},
		{"Month":"Mar","Profit":1500,"Cost":120,"Revenue":1600},
		{"Month":"Apr","Profit":1900,"Cost":130,"Revenue":1300},
		{"Month":"May","Profit":1400,"Cost":90,"Revenue":1000},
		{"Month":"Jun","Profit":2000,"Cost":50,"Revenue":1200},
		{"Month":"Jul","Profit":1800,"Cost":140,"Revenue":1000},
		{"Month":"Aug","Profit":2500,"Cost":80,"Revenue":1600},
		{"Month":"Sep","Profit":3000,"Cost":190,"Revenue":1200},
		{"Month":"Oct","Profit":2000,"Cost":230,"Revenue":1000},
		{"Month":"Nov","Profit":2100,"Cost":240,"Revenue":1700},
		{"Month":"Dec","Profit":1700,"Cost":190,"Revenue":2300}];*/

	return layoutStr;
	 
}

function makeCombinationChart2(chartId, categoryField, yField, displayName, chartData,unit){
	if( unit == null || unit == "" ){
		unit ="";
	}	
	var layoutStr = 
		'<rMateChart backgroundColor="0xFFFFFF" cornerRadius="12" borderStyle="none">'
			+'<Options>'
				+'<SubCaption text="'+unit+'" textAlign="right" />' //단위 
			+'</Options>'			
		+'<NumberFormatter id="numFmt" useThousandsSeparator="true" precision="0"/>'
		+'<Combination2DChart showDataTips="true" >'
		/*  
		Combination3D 차트 생성시에 필요한 Combination3DChart 정의합니다 
		showDataTips : 데이터에 마우스를 가져갔을 때 나오는 Tip을 보이기/안보이기 속성입니다  
		*/	
				+'<verticalAxis>'
					+'<LinearAxis id="vAxis1" formatter="{numFmt}" maximum="20000"/>'
				+'</verticalAxis>'
				+'<horizontalAxis>'
					+'<CategoryAxis categoryField="'+ categoryField +'"/>' 
				+'</horizontalAxis>'
				+'<series>'
					+'<Column2DSeries labelPosition="outside" selectable="true" yField="'+ yField[1] +'" displayName="'+ yField[1] +'">'
					+'	<fill>'
			        +'		<SolidColor color="'+ color[1] +'" alpha="1"/>' //color:색깔 alpha:투명도
			        +'	</fill>'
					+'<showDataEffect>'
						+'<SeriesInterpolate/>' 
					+'</showDataEffect>'
					+'</Column2DSeries>'					

					+'<Line2DSeries labelPosition="up" selectable="true" yField="'+ yField[0] +'" displayName="'+ yField[0] +'" styleName="lineSeriesLabel" showValueLabels="[10]" form="segment" lineStyle="dashLine" dashLinePattern="2" itemRenderer="RectangleItemRenderer" radius="6">'
						+'<lineStroke>'										// lineStroke : 선에 대한 색상 입니다.
				        +'	<Stroke color="'+ color[0] +'" weight="2"/>'		
				        +'</lineStroke>'	
						+'<verticalAxis>'
							+'<LinearAxis id="vAxis2"/>'
						+'</verticalAxis>'
						+'<showDataEffect>'
							+'<SeriesInterpolate/>' 
						+'</showDataEffect>'
					+'</Line2DSeries>'
					
				+'</series>'
				+'<verticalAxisRenderers>'
					+'<Axis3DRenderer axis="{vAxis1}" showLine="true"/>'
					+'<Axis3DRenderer axis="{vAxis2}" showLine="true"/>'
				+'</verticalAxisRenderers>'
			+'</Combination2DChart>'
			+'<Style>'
				+'.lineSeriesLabel{'
					+'color:#777777;'
					+'fontWeight:normal;'
				+'}'
			+'</Style>'
		+'</rMateChart>';
//차트 데이터

	return layoutStr;	 
}  	

function makeCombinationImageChart(url, chartId, categoryField, yField, displayName, chartData,unit){
	if( unit == null || unit == "" ){
		unit ="";
	}
	var layoutStr = 
		'<rMateChart backgroundColor="0xFFFFFF" cornerRadius="12" borderStyle="none">'
			+'<Options>'
				+'<SubCaption text="'+unit+'" textAlign="right" />' //단위 
			+'</Options>'			
			+'<NumberFormatter id="numFmt" useThousandsSeparator="true" precision="0"/>'
			+'<Combination3DChart showDataTips="true">'
		/*  
		Combination3D 차트 생성시에 필요한 Combination3DChart 정의합니다 
		showDataTips : 데이터에 마우스를 가져갔을 때 나오는 Tip을 보이기/안보이기 속성입니다  
		*/	
				+'<verticalAxis>'
					+'<LinearAxis id="vAxis1" formatter="{numFmt}" maximum="3600"/>'
				+'</verticalAxis>'
				+'<horizontalAxis>'
					+'<CategoryAxis categoryField="Month"/>' 
				+'</horizontalAxis>'
				+'<series>'
				+'<ImageSeries yField="Data1" imageDisplayType="single" labelPosition="outside" formatter="{numFmt}">'
								+'<imgSource>'
									+'<ImageSourceItem maintainAspectRatio="false" url="'+ url +'"/>'
								+'</imgSource>'
					+'<showDataEffect>'
						+'<SeriesInterpolate/>' 
					+'</showDataEffect>'
					+'</ImageSeries>'
					+'<Line2DSeries labelPosition="up" selectable="true" yField="Data1" displayName="Data1" styleName="lineSeriesLabel" showValueLabels="[10]" form="segment" lineStyle="dashLine" dashLinePattern="2" itemRenderer="RectangleItemRenderer" radius="6">'
						+'<verticalAxis>'
							+'<LinearAxis id="vAxis2"/>'
						+'</verticalAxis>'
						+'<showDataEffect>'
							+'<SeriesInterpolate/>' 
						+'</showDataEffect>'
					+'</Line2DSeries>'
				+'</series>'
				+'<verticalAxisRenderers>'
					+'<Axis3DRenderer axis="{vAxis1}" showLine="true"/>'
					+'<Axis3DRenderer axis="{vAxis2}" showLine="true"/>'
				+'</verticalAxisRenderers>'
			+'</Combination3DChart>'
			+'<Style>'
				+'.lineSeriesLabel{'
					+'color:#777777;'
					+'fontWeight:normal;'
				+'}'
			+'</Style>'
		+'</rMateChart>';

//차트 데이터
	 chartData = [{"Year":2006,"Data1":1500},
	 				{"Year":2007,"Data1":1000},
	 				{"Year":2008,"Data1":1400},
	 				{"Year":2009,"Data1":1500},
	 				{"Year":2010,"Data1":1900},
	 				{"Year":2011,"Data1":1400},
	 				{"Year":2012,"Data1":1000},
	 				{"Year":2013,"Data1":1400}];

	 return layoutStr;
	 
}

function makeDoughnutChart(chartId, categoryField, yField, chartData,unit){
	if( unit == null || unit == "" ){
		unit ="";
	}

	var layoutStr = 
		'<rMateChart backgroundColor="0xFFFFFF" cornerRadius="12" borderStyle="none">'
			+'<Options>'
			+'	<SubCaption text="'+unit+'" textAlign="right" />' //단위
			+' <Legend position="bottom" hAlign="center" useVisibleCheck="false" labelPlacement="bottom" defaultMouseOverAction="true"/>'
		+'</Options>'
			+'<Pie2DChart id="'+ chartId +'" innerRadius="0.3" showDataTips="true" >'
		/* 
		Doughnut2D 차트 생성시에 필요한 Pie2DChart 정의합니다 
		showDataTips : 데이터에 마우스를 가져갔을 때 나오는 Tip을 보이기/안보이기 속성입니다.  
		innerRadius : PieChart 가운데에 빈 공간을 만듭니다. 유효값 0.1 ~ 0.9 0은 PieChart 1은 차트 사라짐
		*/
				+'<series>'
					+'<Pie2DSeries nameField="'+categoryField+'" field="'+yField+'" labelPosition="callout">'
					/* Pie2DChart 정의 후 Pie2DSeries labelPosition="inside"정의합니다 */
						+'<showDataEffect>'
						/* 차트 생성시에 Effect를 주고 싶을 때 shoDataEffect정의합니다 */
							+'<SeriesSlide duration="1000"/>'
		/* 
		SeriesSlide 효과는 시리즈 데이터가 데이터로 표시될 때 한쪽에서 미끄러지듯 나타나는 효과를 적용합니다
		- 공통속성 -						
		elementOffset : effect를 지연시키는 시간을 지정합니다 default:20
		minimumElementDuration : 각 엘리먼트의 최소 지속 시간을 설정합니다 default:0
					 이 값보다 짧은 시간에 effect가 실행되지 않습니다
		offset : effect개시의 지연시간을 설정합니다 default:0
		perElementOffset : 각 엘리먼트의 개시 지연시간을 설정합니다
		- SeriesSlide속성 -
		*/
						+'</showDataEffect>'
					+'</Pie2DSeries>'
				+'</series>'
			+'</Pie2DChart>'
		+'</rMateChart>';
	
	return layoutStr;
	 
}

function makeDoughnutChart2(chartId, categoryField, yField, chartData,unit){
	if( unit == null || unit == "" ){
		unit ="";
	}

	var layoutStr = 
		'<rMateChart backgroundColor="0xFFFFFF" cornerRadius="12" borderStyle="none">'
			+'<Options>'
			+'	<SubCaption text="'+unit+'" textAlign="right" />' //단위
			+' <Legend position="bottom" hAlign="center" useVisibleCheck="false" labelPlacement="bottom" defaultMouseOverAction="true"/>'
		+'</Options>'
			+'<Pie2DChart id="'+ chartId +'" innerRadius="0.3" showDataTips="true" >'
		/* 
		Doughnut2D 차트 생성시에 필요한 Pie2DChart 정의합니다 
		showDataTips : 데이터에 마우스를 가져갔을 때 나오는 Tip을 보이기/안보이기 속성입니다.  
		innerRadius : PieChart 가운데에 빈 공간을 만듭니다. 유효값 0.1 ~ 0.9 0은 PieChart 1은 차트 사라짐
		*/
				+'<series>'
					+'<Pie2DSeries nameField="'+categoryField+'" field="'+yField+'" labelPosition="callout">'
					/* Pie2DChart 정의 후 Pie2DSeries labelPosition="inside"정의합니다 */
						+'<showDataEffect>'
						/* 차트 생성시에 Effect를 주고 싶을 때 shoDataEffect정의합니다 */
							+'<SeriesSlide duration="1000"/>'
		/* 
		SeriesSlide 효과는 시리즈 데이터가 데이터로 표시될 때 한쪽에서 미끄러지듯 나타나는 효과를 적용합니다
		- 공통속성 -						
		elementOffset : effect를 지연시키는 시간을 지정합니다 default:20
		minimumElementDuration : 각 엘리먼트의 최소 지속 시간을 설정합니다 default:0
					 이 값보다 짧은 시간에 effect가 실행되지 않습니다
		offset : effect개시의 지연시간을 설정합니다 default:0
		perElementOffset : 각 엘리먼트의 개시 지연시간을 설정합니다
		- SeriesSlide속성 -
		*/
						+'</showDataEffect>'
					+'</Pie2DSeries>'
				+'</series>'
			+'</Pie2DChart>'
		+'</rMateChart>';
	
	return layoutStr;
	 
}

function makeGaugeCircularGradientChart(chartId, categoryField, yField, chartData,unit){
	if( unit == null || unit == "" ){
		unit ="";
	}

	var layoutStr = '<rMateChart backgroundColor="#FFFFFF" borderStyle="none">'
		+'<Options>'
		+'	<SubCaption text="'+unit+'" textAlign="right" />' //단위
		+'</Options>'		
      +'<CurrencyFormatter id="numFmt" precision="0" currencySymbol="%" alignSymbol="right"/>'
       +'<CircularGauge width="350" height="350" '
             +'startAngle="120" minimumAngle="0" maximumAngle="300" padding="15" '
            +'minimum="0" maximum="100" value="50" '
             +'interval="10" minorInterval="2" '
          +'tickGap="-16" labelGap="-2" '
          +'majorTickType="none" minorTickType="circle" '
          +'needleLengthRatio="0.8" '
          +'tickLabelPlacement="outside" '
             +'minorTickRadius="1" '
          +'valueXOffset="0" valueYOffset="90" '
           +'tickLabelStyleName="tickText" '
            +'valueLabelStyleName="valueText" '
          +'editMode="true" liveDragging="true" '
          +'bounceAnimating="true" '
           +'showDataTip="true" '
           +'showTrackColor="true" '
            +'trackValues="[0,30,70,100]" '
          +'trackColors="[0x8ec041,0x5ebaef,0xe43345]" '
           +'trackAlphas="[1,1,1]" '
            +'trackInnerRadius="0.5" '
           +'trackOuterRadius="1" '
             +' '
           +'patternJsFunction="patternFunc">'
       /* 게이지에서의 패턴은 trackValues와 관련이 있습니다. */
      /* trackValues를 설정하고 trackColors를 설정합니다. */
      /* 게이지에서의 패턴은 trackColors에 나타나게 됩니다. */
      /* patternMode를 true하여 패턴을 사용할 수 있도록 설정 합니다. */
      /* patternJsFunction을 설정하여 게이지에 패턴을 출력하도록 설정 합니다. */
             +'<frameStroke>'
               +'<Stroke color="#ffffff" weight="1" alpha="0"/>'
          +'</frameStroke>'
      +'</CircularGauge>'
        +'<Style>'
             +'.valueText{'
               +'fontSize:20;'
              +'textAlign:center;'
                 +'borderColor:#999999;'
              +'backgroundColor:#FFFFFF;'
              +'paddingTop:4;'
                 +'borderThickness:1;'
                +'borderAlpha:1;'
                +'borderStyle:none;'
             +'}'
             +'.tickText{'
                +'fontSize:15;'
              +'color:#000000'
             +'}'
         +'</Style>'
    +'</rMateChart>';
	
	return layoutStr; 
	 
}


function makeGaugeCircularGradientChart2(chartId, categoryField, yField, chartData,unit){
	if( unit == null || unit == "" ){
		unit ="";
	}

	var layoutStr = '<rMateChart backgroundColor="#FFFFFF" borderStyle="none">'
		+'<Options>'
		+'	<SubCaption text="'+unit+'" textAlign="right" />' //단위
		+'</Options>'	
      +'<CurrencyFormatter id="numFmt" precision="0" currencySymbol="%" alignSymbol="right"/>'
       +'<CircularGauge width="350" height="350" '
             +'startAngle="120" minimumAngle="0" maximumAngle="300" padding="15" '
            +'minimum="0" maximum="1000" value="50" '
             +'interval="100" minorInterval="2" '
          +'tickGap="-16" labelGap="-2" '
          +'majorTickType="none" minorTickType="circle" '
          +'needleLengthRatio="0.8" '
          +'tickLabelPlacement="outside" '
             +'minorTickRadius="1" '
          +'valueXOffset="0" valueYOffset="90" '
           +'tickLabelStyleName="tickText" '
            +'valueLabelStyleName="valueText" '
          +'editMode="true" liveDragging="true" '
          +'bounceAnimating="true" '
           +'showDataTip="true" '
           +'showTrackColor="true" '
            +'trackValues="[0,100,200,300,400,500,600,700,800,900,1000]" '
          +'trackColors="[0x8ec041,0x5ebaef,0xe43345,0x8ec041,0x5ebaef,0xe43345,0x8ec041,0x5ebaef,0xe43345,0x8ec041]" '
           +'trackAlphas="[1,1,1]" '
            +'trackInnerRadius="0.5" '
           +'trackOuterRadius="1" '
             +' '
           +'patternJsFunction="patternFunc">'
       /* 게이지에서의 패턴은 trackValues와 관련이 있습니다. */
      /* trackValues를 설정하고 trackColors를 설정합니다. */
      /* 게이지에서의 패턴은 trackColors에 나타나게 됩니다. */
      /* patternMode를 true하여 패턴을 사용할 수 있도록 설정 합니다. */
      /* patternJsFunction을 설정하여 게이지에 패턴을 출력하도록 설정 합니다. */
             +'<frameStroke>'
               +'<Stroke color="#ffffff" weight="1" alpha="0"/>'
          +'</frameStroke>'
      +'</CircularGauge>'
        +'<Style>'
             +'.valueText{'
               +'fontSize:20;'
              +'textAlign:center;'
                 +'borderColor:#999999;'
              +'backgroundColor:#FFFFFF;'
              +'paddingTop:4;'
                 +'borderThickness:1;'
                +'borderAlpha:1;'
                +'borderStyle:none;'
             +'}'
             +'.tickText{'
                +'fontSize:15;'
              +'color:#000000'
             +'}'
         +'</Style>'
    +'</rMateChart>';
	
	return layoutStr; 
	 
}

function makeMapChart(color, chartId, chartData){
	
	/*var layoutStr  = '<?xml version="1.0" encoding="utf-8"?>															';
	layoutStr += '    <rMateMapChart horizontalAlign="center">														';
	layoutStr += '        <MapChart id="mainMap" showDataTips="true" dataTipJsFunction="dataTipFunction" mapChangeJsFunction="clickFunction">													';
	layoutStr += '            <series>																	';
	layoutStr += '                <MapSeries id="mapseries" selectionMarking="line" labelPosition="inside" displayName="Map Series"  localFillJsFunction="colorFunction">	';
	layoutStr += '                    <filters>																';
	layoutStr += '                        <DropShadowFilter distance="1" angle="45" color="#888888"/>									';
	layoutStr += '                    </filters>																';
	layoutStr += '                    <showDataEffect>															';
	layoutStr += '                        <SeriesInterpolate duration="1000" />												';
	layoutStr += '                    </showDataEffect>															';
	layoutStr += '                    <stroke>																';
	layoutStr += '                        <Stroke color="#FFF" weight="0.8" alpha="1"/>											';
	layoutStr += '                    </stroke>																';
	layoutStr += '                </MapSeries>																';
	layoutStr += '            </series>																	'; 
	layoutStr += '        </MapChart>																	'; 
	layoutStr += '        <Box horizontalAlign="center" paddingTop="20" horizontalScrollPolicy="off" verticalScrollPolicy="off">						';
	layoutStr += '            <SubLegend direction="horizontal" height="30" borderStyle="solid" defaultMouseOverAction="true">			                        ';
	layoutStr += '                <LegendItem label="30이하">				                                                                                        ';
	layoutStr += '                    <fill>					                                                                                        ';
	layoutStr += '                        <SolidColor color="#BFE4FF"/>				                                                                        ';
	layoutStr += '                    </fill>			                                                                                                        ';
	layoutStr += '                </LegendItem>			                                                                                                        ';
	layoutStr += '                <LegendItem label="50이하">															';
	layoutStr += '                    <fill>																';
	layoutStr += '                        <SolidColor color="#B6C5FF"/>													';
	layoutStr += '                    </fill>																';
	layoutStr += '                </LegendItem>																';
	layoutStr += '                <LegendItem label="90이하">															';
	layoutStr += '                    <fill>																';
	layoutStr += '                        <SolidColor color="#90B2FF"/>													';
	layoutStr += '                    </fill>																';
	layoutStr += '                </LegendItem>																';
	layoutStr += '                <LegendItem label="90이상">															';
	layoutStr += '                    <fill>																';
	layoutStr += '                        <SolidColor color="#5589F2"/>													';
	layoutStr += '                    </fill>																';
	layoutStr += '                </LegendItem>																';
	layoutStr += '            </SubLegend>																	';
	layoutStr += '        </Box>																		';
	layoutStr += '    </rMateMapChart>																	';*/
	
	var layoutStr  = '<?xml version="1.0" encoding="utf-8"?>                                                                                                                                                                                                                                                                                                                                        ';
//	layoutStr += '	<rMateMapChart>                                                                                                                                                                                                                                                                                                                                                               ';
//	layoutStr += '		<MapChart id="mainMap1" showDataTips="true" dataTipType="Type2">                                                                                                                                                                                                                                                                                                      ';
//	layoutStr += '			<series>                                                                                                                                                                                                                                                                                                                                                      ';
//	layoutStr += '				<MapSeries id="mapseries" interactive="true" selectionMarking="color" color="#777777" labelPosition="none" displayName="Map" selectionStrokeAlpha="0" rollOverFill="transparent" transparentValue="60">                                                                                                                                               ';
//	layoutStr += '					<selectionFill>                                                                                                                                                                                                                                                                                                                               ';
//	layoutStr += '						<SolidColor color="#ffffff" />                                                                                                                                                                                                                                                                                                        ';
//	layoutStr += '					</selectionFill>                                                                                                                                                                                                                                                                                                                              ';
//	layoutStr += '					<selectionStroke>                                                                                                                                                                                                                                                                                                                             ';
//	layoutStr += '						<Stroke color="#ffffff" weight="0" alpha="1"/>                                                                                                                                                                                                                                                                                        ';
//	layoutStr += '					</selectionStroke>                                                                                                                                                                                                                                                                                                                            ';
//	layoutStr += '					<rollOverStroke>                                                                                                                                                                                                                                                                                                                              ';
//	layoutStr += '						<Stroke color="#ffffff" weight="0" alpha="1"/>                                                                                                                                                                                                                                                                                        ';
//	layoutStr += '					</rollOverStroke>                                                                                                                                                                                                                                                                                                                             ';
//	layoutStr += '					<showDataEffect>                                                                                                                                                                                                                                                                                                                              ';
//	layoutStr += '						<SeriesInterpolate duration="1000"/>                                                                                                                                                                                                                                                                                                  ';
//	layoutStr += '					</showDataEffect>                                                                                                                                                                                                                                                                                                                             ';
//	layoutStr += '				</MapSeries>                                                                                                                                                                                                                                                                                                                                          ';
//	layoutStr += '				<MapImageSeries id="image" labelField="label" imageUrlField="imgurl" horizontalCenterGapField="h" verticalCenterGapField="v" color="#ffffff" labelPosition="bottom" imageWidth="57" imageHeight="55" selectedFill="#0f0" interactive="false" disabledColor="#ffffff" areaCodeField="code"><showDataEffect><SeriesSlide duration="1000"/></showDataEffect></MapImageSeries>';
//	layoutStr += '			</series>                                                                                                                                                                                                                                                                                                                                                     ';
//	layoutStr += '		</MapChart>                                                                                                                                                                                                                                                                                                                                                           ';
//	layoutStr += '	</rMateMapChart>                                                                                                                                                                                                                                                                                                                                                              ';

	layoutStr += '  <rMateMapChart>                                                                                                                                                                                          ';
	layoutStr += '  	<MapChart id="mainMap" showDataTips="true" drillDownEnabled="false" dataTipJsFunction="dataTipFunction" mapChangeJsFunction="clickFunction">                                                                                                                                                ';
	layoutStr += '  		<series>                                                                                                                                                                                 ';
	layoutStr += '  			<MapSeries id="mapseries" labelPosition="inside" hideOverSizeLabel="false"  selectionMarking="color" selectionMarkLineColor="#758d99" rollOverFilter="true" localFill="#ebf0f4">  ';
	layoutStr += '  				<filters>                                                                                                                                                                ';
	layoutStr += '  					<DropShadowFilter distance="5" angle="90" color="#888888" blur="0"/>                                                                                             ';
	layoutStr += '  				</filters>                                                                                                                                                               ';
	layoutStr += '  				<showDataEffect>                                                                                                                                                         ';
	layoutStr += '  					<SeriesInterpolate duration="1000"/>                                                                                                                             ';
	layoutStr += '  				</showDataEffect>                                                                                                                                                        ';
	layoutStr += '  				<selectionFill>                                                                                                                                                          ';
	layoutStr += '  					<SolidColor color="#f6b149"/>                                                                                                                                    ';
	layoutStr += '  				</selectionFill>                                                                                                                                                         ';
	layoutStr += '  				<rollOverFill>                                                                                                                                                           ';
	layoutStr += '  					<SolidColor color="#f6b149"/>                                                                                                                                    ';
	layoutStr += '  				</rollOverFill>                                                                                                                                                          ';
	layoutStr += '  				<rollOverStroke>                                                                                                                                                         ';
	layoutStr += '  					<Stroke color="#f6b149" weight="0.25" alpha="0.25"/>                                                                                                             ';
	layoutStr += '  				</rollOverStroke>                                                                                                                                                        ';
	layoutStr += '  				<stroke>                                                                                                                                                                 ';
	layoutStr += '  					<Stroke color="#CAD7E0" weight="0.8" alpha="1"/>                                                                                                                 ';
	layoutStr += '  				</stroke>                                                                                                                                                                ';
	layoutStr += '  			</MapSeries>                                                                                                                                                                     ';
	layoutStr += '  		</series>                                                                                                                                                                                ';
	layoutStr += '  	</MapChart>                                                                                                                                                                                      ';
	layoutStr += '  </rMateMapChart>                                                                                                                                                                                         ';
	
	
	return layoutStr;
	
}

function makeImageRepeatChart(url, chartId, categoryField, yField, chartData,unit){
	if( unit == null || unit == "" ){
		unit ="";
	}

	var layoutStr = 
		'<rMateChart backgroundColor="0xFFFFFF" cornerRadius="12" borderStyle="none">'
			+'<Options>'
				+'<SubCaption text="'+unit+'" textAlign="right" />' //단위 
			+'</Options>'			
			+'<NumberFormatter id="numFmt"/>' 
			+'<ImageChart id="chart" showDataTips="true" gutterLeft="20" gutterRight="20" showLabelVertically="true" fontFamily="맑은 고딕">'
			/*  
			Image 차트 생성시에 필요한 ImageChart 정의합니다 
			showDataTips : 데이터에 마우스를 가져갔을 때 나오는 Tip을 보이기/안보이기 속성입니다  
			*/ 
				+'<horizontalAxis>'
					+'<CategoryAxis id="hAxis" categoryField="'+ categoryField +'"/>'
				+'</horizontalAxis>'
				+'<verticalAxis>'
					+'<LinearAxis id="vAxis"/>'
				+'</verticalAxis>'
				+'<series>'
					+'<ImageSeries yField="'+ yField +'" imageDisplayType="singleRepeat" labelPosition="outside" formatter="{numFmt}">'
					/* 
					ImageChart 정의 후 ImageSeries 정의합니다 
					imageDisplayType ┬ single : 이미지 한개
							 ├ singleRepeat : 이미지 한개 반복
							 └ multiple : 다중 이미지
					 */
						+'<imgSource>'
							+'<ImageSourceItem url="'+ url +'"/>'
						+'</imgSource>'
						+'<showDataEffect>'
							+'<SeriesSlide duration="1000" direction="up"/>'
						+'</showDataEffect>'
					+'</ImageSeries>'
				+'</series>'
				+'<verticalAxisRenderers>'
					+'<Axis2DRenderer axis="{vAxis}" visible="false"/>'
				+'</verticalAxisRenderers>'
			+'</ImageChart>'
		+'</rMateChart>';
	
	return layoutStr;
	 
}

function makeBubbleMapChart(color, chartId, chartData,unit){
	if( unit == null || unit == "" ){
		unit ="";
	}
	
	var layoutStr  = '<?xml version="1.0" encoding="utf-8"?>															';
	layoutStr += '    <rMateMapChart horizontalAlign="center">														';
	layoutStr += '        <MapChart id="mainMap" showDataTips="true" >													';
	layoutStr += '            <series>																	';
	layoutStr += '                <MapSeries id="mapseries" selectionMarking="line" labelPosition="none" displayName="Map Series" localFillJsFunction="colorFunction" >	';
	layoutStr += '                    <showDataEffect>															';
	layoutStr += '                        <SeriesInterpolate duration="1000" />												';
	layoutStr += '                    </showDataEffect>															';
	layoutStr += '                    <stroke>																';
	layoutStr += '                        <Stroke color="#FFF" weight="0.8" alpha="1"/>											';
	layoutStr += '                    </stroke>																';
	layoutStr += '                </MapSeries>																';
	layoutStr += '            </series>																	'; 
	layoutStr += '        </MapChart>																	'; 
	layoutStr += '        <Box horizontalAlign="center" paddingTop="30" horizontalScrollPolicy="off" verticalScrollPolicy="off">						';
	layoutStr += '            <SubLegend useVisibleCheck="true" direction="horizontal" height="30" borderStyle="solid" defaultMouseOverAction="true" paddingTop="8" backgroundColor="#fefefe">			                        ';
	layoutStr += '                <LegendItem label="30이하">				                                                                                        ';
	layoutStr += '                    <fill>					                                                                                        ';
	layoutStr += '                        <SolidColor color="#BFE4FF"/>				                                                                        ';
	layoutStr += '                    </fill>			                                                                                                        ';
	layoutStr += '                </LegendItem>			                                                                                                        ';
	layoutStr += '                <LegendItem label="50이하">															';
	layoutStr += '                    <fill>																';
	layoutStr += '                        <SolidColor color="#B6C5FF"/>													';
	layoutStr += '                    </fill>																';
	layoutStr += '                </LegendItem>																';
	layoutStr += '                <LegendItem label="90이하">															';
	layoutStr += '                    <fill>																';
	layoutStr += '                        <SolidColor color="#90B2FF"/>													';
	layoutStr += '                    </fill>																';
	layoutStr += '                </LegendItem>																';
	layoutStr += '                <LegendItem label="90이상">															';
	layoutStr += '                    <fill>																';
	layoutStr += '                        <SolidColor color="#5589F2"/>													';
	layoutStr += '                    </fill>																';
	layoutStr += '                </LegendItem>																';
	layoutStr += '            </SubLegend>																	';
	layoutStr += '        </Box>																		';
	layoutStr += '    </rMateMapChart>																	';
	
	return layoutStr;
		
}

function makeBarChartClick(chartId, categoryField, yField, chartData, functionNm,unit){
	if( unit == null || unit == "" ){
		unit ="";
	}

	var layoutStr = 
		'<rMateChart backgroundColor="0xFFFFFF" cornerRadius="12" borderStyle="none">'
		+'<Options>'
			+'<SubCaption text="'+unit+'" textAlign="right" />' //단위 		
		+'</Options>'
			+'<Bar2DChart showDataTips="true"  itemClickJsFunction="'+functionNm+'">'
				+'<horizontalAxis>'
					+'<LinearAxis />' //minimum="10000" maximum="50000" interval="5000"
				+'</horizontalAxis>'
				+'<verticalAxis>'
					+'<CategoryAxis categoryField="'+ categoryField +'"/>' 
				+'</verticalAxis>'
				+'<series>'
					+'<Bar2DSeries labelPosition="inside" xField="'+ yField +'" displayName="'+ yField +'"  color="#ffffff">'
						+'<showDataEffect>'
							+'<SeriesInterpolate />' 
						+'</showDataEffect>'
					+'</Bar2DSeries>'
				+'</series>'
			+'</Bar2DChart>'
		+'</rMateChart>';
	
	
	
	return layoutStr;
	 
}

function makePatternColumnChart(chartId, categoryField, yField, chartData,unit){
	if( unit == null || unit == "" ){
		unit ="";
	}
	
	var layoutStr = '<rMateChart backgroundColor="0xFFFFFF" borderStyle="none">'
		+'<Options>'
		+'<SubCaption text="'+unit+'" textAlign="right" />' //단위 	
		+'<Legend defaultMouseOverAction="true"/>'
	+'</Options>'
		+'<NumberFormatter id="numfmt" useThousandsSeparator="true"/>'
		/* 차트 초기 출력시 웹 접근성 패턴을 설정하여 출력하고 싶다면 아래처럼 patternMode를 true로 설정하십시오. */
		+'<Column2DChart showDataTips="true" >'
			+'<horizontalAxis>'
				+'<CategoryAxis categoryField="'+categoryField+'"/>'
			+'</horizontalAxis>'
			+'<verticalAxis>'
				+'<LinearAxis formatter="{numfmt}"/>'
			+'</verticalAxis>'
			+'<series>'
				+'<Column2DSet type="stacked" showTotalLabel="true">'
					+'<series>'
						+'<Column2DSeries yField="'+yField+'" displayName="'+yField+'">'
							+'<showDataEffect>'
								+'<SeriesInterpolate/>' 
							+'</showDataEffect>'
						+'</Column2DSeries>'
					+'</series>'
				+'</Column2DSet>'
			+'</series>'
		+'</Column2DChart>'
	+'</rMateChart>';
	
	return layoutStr;
	 
}
function makeImageChart(url, chartId, categoryField, yField, displayName, chartData,unit){
	if( unit == null || unit == "" ){
		unit ="";
	}

	var layoutStr  = '<rMateChart backgroundColor="0xFFFFFF" cornerRadius="12" borderStyle="none">                                                     '
		+'<Options>'
			+'<SubCaption text="'+unit+'" textAlign="right" />' //단위 	
		+'</Options>'
     +'    <NumberFormatter id="numFmt"/>                                                                                               '
     +'    <ImageChart id="chart" showDataTips="true" gutterLeft="20" gutterRight="20" showLabelVertically="true" fontFamily="맑은 고딕"> '
     +'        <horizontalAxis>                                                                                                         '
     +'            <CategoryAxis id="hAxis" categoryField="'+categoryField+'"/>                                                                      '
     +'        </horizontalAxis>                                                                                                        '
     +'        <verticalAxis>                                                                                                           '
     +'            <LinearAxis id="vAxis"/>                                                                                             '
     +'        </verticalAxis>                                                                                                          '
     +'        <series>                                                                                                                 '
     +'            <ImageSeries yField="'+yField+'" imageDisplayType="single" labelPosition="outside" formatter="{numFmt}">                  '
     +'                <imgSource>                                                                                                      '
     +'                    <ImageSourceItem maintainAspectRatio="true" url="'+url+'"/>           '
     +'                </imgSource>                                                                                                     '
     +'                <showDataEffect>                                                                                                 '
     +'                    <SeriesSlide duration="1000" direction="up"/>                                                                '
     +'                </showDataEffect>                                                                                                '
     +'            </ImageSeries>                                                                                                       '
     +'        </series>                                                                                                                '
     +'        <verticalAxisRenderers>                                                                                                  '
     +'            <Axis2DRenderer axis="{vAxis}" visible="false"/>                                                                     '
     +'        </verticalAxisRenderers>                                                                                                 '
     +'    </ImageChart>                                                                                                                '
     +'</rMateChart>                                                                                                                    '

//차트 데이터
//	 chartData = [{"Year":2006,"Data1":1500},
//	 				{"Year":2007,"Data1":1000},
//	 				{"Year":2008,"Data1":1400},
//	 				{"Year":2009,"Data1":1500},
//	 				{"Year":2010,"Data1":1900},
//	 				{"Year":2011,"Data1":1400},
//	 				{"Year":2012,"Data1":1000},
//	 				{"Year":2013,"Data1":1400}];

	 return layoutStr;
	 
}

function makeLineMultiDualChart(chartId, categoryField, yField, dual, displayName, chartData,unit){
	if( unit == null || unit == "" ){
		unit ="";
	}

	var layoutStr = 
		'<rMateChart cornerRadius="12" backgroundColor="0xffffff" borderStyle="none">'
		+'<Options>'
			+'<SubCaption text="'+unit+'" textAlign="right" />' //단위 			
			+'<Legend defaultMouseOverAction="false" useVisibleCheck="true"/>'
		+'</Options>'
		+'<NumberFormatter id="numFmt" precision="0"/>'
		+'<Line2DChart showDataTips="true" dataTipDisplayMode="axis" paddingTop="0">'
			+'<horizontalAxis>'
				+'<CategoryAxis categoryField="'+ categoryField +'"/>'
			+'</horizontalAxis>'
			+'<verticalAxis>'
				+'<LinearAxis />'
			+'</verticalAxis>'
			+'<series>';
	for(var i = 0 ; i < yField.length ; i++){	
				/* 
				itemRenderer는 Tip이 보여지는 영역차트 부분에 ItemRenderer에서 제공하는 모양을 그려줍니다
				이 예제에서는 Diamond입니다
				사용할 수 있는 도형을 모두 표현한 예제는 Chart Samples 의 범례 예제를 참고하십시오.
				*/
					/* 아이템렌더러(데이터 마커) 테두리 색상 */
	if(i < (yField.length-1)){
		layoutStr += '<Line2DSeries labelPosition="up" yField="'+yField[i]+'" displayName="'+displayName[i]+'" form="segment" lineStyle="dashLine" dashLinePattern="2" itemRenderer="RectangleItemRenderer" radius="6" >'
					+'<verticalAxis>'
			        +'	<LinearAxis id="vAxis'+(i+1)+'" />'
			        +'</verticalAxis>';
	}else{
		layoutStr += '<Line2DSeries labelPosition="up" yField="'+yField[i]+'" displayName="'+displayName[i]+'" verticalAxis="{vAxis1}" form="segment" lineStyle="dashLine" dashLinePattern="2" itemRenderer="RectangleItemRenderer" radius="6" >'
	}
	layoutStr += '<showDataEffect>'
						+'<SeriesInterpolate/>'
					+'</showDataEffect>'
				+'</Line2DSeries>';
	}				
	layoutStr += '</series>';
	layoutStr += '  		<verticalAxisRenderers>' 
	for(var i = 0 ; i < dual.length ; i++){	
		layoutStr += '  			<Axis2DRenderer axis="{vAxis'+(i+1)+'}" placement="'+dual[i]+'"/>'; 
	}
	layoutStr += '  		</verticalAxisRenderers>';	
	layoutStr += '<annotationElements>'
				+'<CrossRangeZoomer zoomType="horizontal" fontSize="11" color="0xFFFFFF" horizontalLabelFormatter="{numFmt}" verticalLabelPlacement="bottom" horizontalLabelPlacement="left" enableZooming="false" enableCrossHair="true" backgroundColor="0xeb494a" borderColor="0xeb494a">'
				+'</CrossRangeZoomer>'
			+'</annotationElements>'
		+'</Line2DChart>'
	+'</rMateChart>';

//차트 데이터
				return layoutStr; 
}


function makeLineMultiDualChart2(chartId, categoryField, yField, dual, displayName, chartData,unit){
	if( unit == null || unit == "" ){
		unit ="";
	}

	var layoutStr = 
		'<rMateChart cornerRadius="12" backgroundColor="0xffffff" borderStyle="none">'
		+'<Options>'
			+'<SubCaption text="'+unit+'" textAlign="right" />' //단위 
			+'<Legend defaultMouseOverAction="false" useVisibleCheck="true"/>'
		+'</Options>'
		+'<NumberFormatter id="numFmt" precision="0"/>'
		+'<Line2DChart showDataTips="true" dataTipDisplayMode="axis" paddingTop="0">'
			+'<horizontalAxis>'
				+'<CategoryAxis categoryField="'+ categoryField +'"/>'
			+'</horizontalAxis>'
			+'<verticalAxis>'
				+'<LinearAxis />'
			+'</verticalAxis>'
			+'<series>';
	for(var i = 0 ; i < yField.length ; i++){	
				/* 
				itemRenderer는 Tip이 보여지는 영역차트 부분에 ItemRenderer에서 제공하는 모양을 그려줍니다
				이 예제에서는 Diamond입니다
				사용할 수 있는 도형을 모두 표현한 예제는 Chart Samples 의 범례 예제를 참고하십시오.
				*/
					/* 아이템렌더러(데이터 마커) 테두리 색상 */
	if(i < (yField.length-1)){
		layoutStr += '<Line2DSeries labelPosition="up" yField="'+yField[i]+'" displayName="'+yField[i]+'" form="segment" lineStyle="dashLine" dashLinePattern="2" itemRenderer="RectangleItemRenderer" radius="6" >'
					+'<verticalAxis>'
			        +'	<LinearAxis id="vAxis'+(i+1)+'" formatter="{fmt}"/>'
			        +'</verticalAxis>';
	}else{
		layoutStr += '<Line2DSeries labelPosition="up" yField="'+yField[i]+'" displayName="'+yField[i]+'" verticalAxis="{vAxis1}" form="segment" lineStyle="dashLine" dashLinePattern="2" itemRenderer="RectangleItemRenderer" radius="6" >'
	}
	layoutStr += '<showDataEffect>'
						+'<SeriesInterpolate/>'
					+'</showDataEffect>'
				+'</Line2DSeries>';
	}				
	layoutStr += '</series>';
	layoutStr += '  		<verticalAxisRenderers>' 
	for(var i = 0 ; i < dual.length ; i++){	
		layoutStr += '  			<Axis2DRenderer axis="{vAxis'+(i+1)+'}" placement="'+dual[i]+'"/>'; 
	}
	layoutStr += '  		</verticalAxisRenderers>';	
	layoutStr += '<annotationElements>'
				+'<CrossRangeZoomer zoomType="horizontal" fontSize="11" color="0xFFFFFF" horizontalLabelFormatter="{numFmt}" verticalLabelPlacement="bottom" horizontalLabelPlacement="left" enableZooming="false" enableCrossHair="true" backgroundColor="0xeb494a" borderColor="0xeb494a">'
				+'</CrossRangeZoomer>'
			+'</annotationElements>'
		+'</Line2DChart>'
	+'</rMateChart>';

//차트 데이터
				return layoutStr; 
}

