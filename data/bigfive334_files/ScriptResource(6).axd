﻿
Type.registerNamespace('PPSMA');PPSMA.ItemType=function(){};PPSMA.ItemType.prototype = {Series:0,Points:1,Category:2,Background:3,ViewInfoBar:4,LegendLocation:5}
PPSMA.ItemType.registerEnum('PPSMA.ItemType',false);PPSMA.LegendLocation=function(){};PPSMA.LegendLocation.prototype = {hide:0,right:1,top:2}
PPSMA.LegendLocation.registerEnum('PPSMA.LegendLocation',false);PPSMA.$create_ChartDomEvent=function(button,offsetX,offsetY,srcElement,uiReferenceElement){var $o={};$o.type='pps-contextmenu';$o.button=button;$o.offsetX=offsetX;$o.offsetY=offsetY;$o.srcElement=srcElement;$o.uiReferenceElement=uiReferenceElement;return $o;}
PPSMA.ChartDomEventTypes=function(){}
PPSMA.OlapChart=function(chartCtxName,olapViewContext,properties){this.$2=chartCtxName;this.$3=olapViewContext;this.$4=properties;this.$5=[];this.$6=null;this.$9=0;this.$A=0;this.$E=0;this._changeMeasure=new PPSMA.ChangeMeasure(this.$2,this.$3);this._valueFilter=new PPSMA.FilterDialog(olapViewContext,chartCtxName);this.$14=false;if(this.$3){var $0=$get(this.$3.get_outerTargetId());this.$19($0);Sys.UI.DomEvent.clearHandlers($0);this.$3.setOuterTagAttribute('arFilterState','');Sys.UI.DomEvent.addHandler($0,'propertychange',Function.createDelegate(this,this.$1A));}Sys.UI.DomEvent.addHandler(document.body,'touchstart',Function.createDelegate(this,function($p1_0){
}));PPSMA.Trace.addFilters(['ChartContextMenu'],false);}
PPSMA.OlapChart.$1B=function($p0){while($p0&&!PPSMA.DomElementEx.tagsMatch($p0.tagName,'div')&&!PPSMA.DomElementEx.tagsMatch($p0.tagName,'body')){$p0=$p0.parentNode;}return $p0;}
PPSMA.OlapChart.$35=function($p0){var $0=$p0.type;if(($0==='click')&&($p0.button!==2)){return true;}return false;}
PPSMA.OlapChart.$36=function($p0){var $0=$p0.type;return (($0==='contextmenu')||$0==='pps-contextmenu'||(($0==='mouseup')&&($p0.button===2)));}
PPSMA.OlapChart.prototype={$2:null,$3:null,$4:null,$5:null,$6:null,$7:0,$8:0,$9:0,$A:0,$B:null,$C:null,$D:0,$E:0,$F:null,$10:null,$11:null,$12:null,$13:null,_changeMeasure:null,_valueFilter:null,$14:false,$15:0,$16:null,$19:function($p0){if($p0&&this.$3&&this.$3.get_results()){var $0='row:{0};col:{1};emptyrow:{2};emptycol:{3};sortrow:{4};sortcol:{5}';var $1='no';var $2='no';var $3='no';var $4='no';var $5;var $6;if(this.$3.get_results().get_valueFilterRow()===1){$1='value';}if(this.$3.get_results().get_topFilterRow()===1){$1='top';}if(this.$3.get_results().get_valueFilterCol()===1){$2='value';}if(this.$3.get_results().get_topFilterCol()===1){$2='top';}if((this.$3.get_results().get_filterEmptyAxis()&2)>0){$3='yes';}if((this.$3.get_results().get_filterEmptyAxis()&1)>0){$4='yes';}$5=this.$3.get_results().get_sortTypeRow();$6=this.$3.get_results().get_sortTypeCol();$0=String.format($0,$1,$2,$3,$4,$5,$6);this.$3.setOuterTagAttribute('arFilterState',$0);}},$1A:function($p0){var $0='window.event.propertyName';var $1=eval($0);switch($1){case 'executeValueFilterRow':this.filterByValue('2');break;case 'executeTopFilterRow':this.filterByTopBottom('2');break;case 'clearFilterRow':this.$3.clearFilter('2',false);break;case 'executeValueFilterCol':this.filterByValue('1');break;case 'executeTopFilterCol':this.filterByTopBottom('1');break;case 'clearFilterCol':this.$3.clearFilter('1',true);break;case 'filterEmptyRows':this.filterEmptyRow();break;case 'filterEmptyCols':this.filterEmptyCol();break;case 'sortAscRow':this.sort('2','asc');break;case 'sortDescRow':this.sort('2','desc');break;case 'noSortRow':this.sort('2','nosort');break;case 'sortAscCol':this.sort('1','asc');break;case 'sortDescCol':this.sort('1','desc');break;case 'noSortCol':this.sort('1','nosort');break;case 'MeasureGroupName':this.handleMeasureGroupNameChange();break;}},onF:function(o,a){this.$10=o;this.$11=a;},onKD:function(e){if(!this.$11){return;}switch(e.keyCode){case 13:this.$28(null);break;case 93:PPSMA.Trace.eventEx(['ChartContextMenu'],e,'OnKD: context-menu');PPSMA.Trace.domElementEx(['ChartContextMenu'],this.$10,'OnKD: Focused Area',2|16|32);var $0;var $1;if(getBrowserIs().ie55up){var $3=Sys.UI.DomElement.getLocation(PPSMA.OlapChart.$1B(this.$10));$0=$3.x;$1=$3.y;}else{var $4=this.$10.coords.split(',');$0=parseInt($4[0]);$1=parseInt($4[1]);}var $2=PPSMA.$create_ChartDomEvent(2,$0+2,$1+2,this.$10,this.$10);this.$28($2);break;default:return;}},sOnTS:function(e,a){if (e.touches != undefined && e.touches.length == 1){;this.$26(a,0);if(this.$D===1){this.$9=0;}this.$D=0;this.$12=e.srcElement;this.$16=e;this.$15=window.setTimeout(Function.createDelegate(this,this.doShowContextMenu),1500);}else{;window.clearTimeout(this.$15);};},sOnC:function(e,a){this.$26(a,0);if(this.$D===1){this.$9=0;}this.$D=0;if(this.$32(e)&&!PPSMA.Menu.IsOpen(this.$6)){this.drillDown();}else if(PPSMA.OlapChart.$36(e)){PPSMA.Trace.eventEx(['ChartContextMenu'],e,'SOnC: context-menu');this.$1E(e);}return;},pOnTS:function(e,a){if (e.touches != undefined && e.touches.length == 1){;this.$26(a,1);this.$27();if(!this.$D){this.$9=0;}this.$D=1;this.$16=e;this.$15=window.setTimeout(Function.createDelegate(this,this.doShowContextMenu),1500);}else{;window.clearTimeout(this.$15);};},pOnC:function(e,a){this.$26(a,1);this.$27();if(!this.$D){this.$9=0;}this.$D=1;if(this.$32(e)&&!PPSMA.Menu.IsOpen(this.$6)){this.drillDown();}else if(PPSMA.OlapChart.$36(e)){PPSMA.Trace.eventEx(['ChartContextMenu'],e,'POnC: context-menu');this.$1E(e);this.$14=false;}return;},xOnTS:function(e,a){if (e.touches != undefined && e.touches.length == 1){;this.$26(a,2);if(this.$D===1){this.$9=0;}this.$D=2;this.$E=2;this.$12=e.srcElement;this.$16=e;this.$15=window.setTimeout(Function.createDelegate(this,this.doShowContextMenu),1500);}else{;window.clearTimeout(this.$15);};},xOnC:function(e,a){this.$26(a,2);if(this.$D===1){this.$9=0;}this.$D=2;this.$E=2;if(this.$32(e)&&!PPSMA.Menu.IsOpen(this.$6)){this.drillDown();}else if(PPSMA.OlapChart.$36(e)){PPSMA.Trace.eventEx(['ChartContextMenu'],e,'XOnC: context-menu');this.$1E(e);}else{return;}},bgOnTS:function(e,a){if (e.touches != undefined && e.touches.length == 1){;this.$D=3;this.$12=e.srcElement;Array.clear(this.$5);this.$11=null;this.$16=e;this.$15=window.setTimeout(Function.createDelegate(this,this.doShowContextMenu),1500);}else{;window.clearTimeout(this.$15);};},bgOnC:function(e){if(PPSMA.OlapChart.$36(e)){PPSMA.Trace.eventEx(['ChartContextMenu'],e,'BGOnC: context-menu');if(!this.$1C(e)){return;}this.$D=3;this.$12=e.srcElement;Array.clear(this.$5);this.$11=null;var $0=this.$1D(e);PPSMA.ContextMenu.create(PPSMA.OlapChart.$1B(e.srcElement),this,$0.x,$0.y,false);}},$1C:function($p0){var $0=$p0.type;if($0==='pps-contextmenu'||$0==='contextmenu'){return true;}return false;},$1D:function($p0){var $0,$1;var $2=PPSMA.EventsEx.getCurrentElement($p0);if((Sys.Browser.agent===Sys.Browser.Safari)&&($2.tagName.toLowerCase()==='area')){var $3=$2.parentNode;var $4=Sys.UI.DomElement.getLocation($3);$0=$p0.pageX-$4.x;$1=$p0.pageY-$4.y;}else if(!isNullOrUndefined($p0.pageX)){var $5=Sys.UI.DomElement.getLocation($2);$0=$p0.pageX-$5.x;$1=$p0.pageY-$5.y;}else if(!isNullOrUndefined($p0.offsetX)){$0=$p0.offsetX;$1=$p0.offsetY;}else{$0=PPSMA.SizeEx.getXOffset($p0,$2);$1=PPSMA.SizeEx.getYOffset($p0,$2);}return new Sys.UI.Point($0,$1);},fOnC:function(e,i,h,t,l,v1,v2,a){this.loadFilterDialog(i,h,t,l,v1,v2,a);},doShowContextMenu:function(){this.$14=true;this.$1E(this.$16);},handleTouchMove:function(e){if(e.targetTouches != undefined && e.targetTouches[0] != undefined){if (Math.abs(e.targetTouches[0].screenX - this._screenTouchPositionX) >= PPSMA.OlapChart._contextCancelDeltaX || Math.abs(e.targetTouches[0].screenY - this._screenTouchPositionY) >= PPSMA.OlapChart._contextCancelDeltaX){window.clearTimeout(this.lastTimeout);}};},handleTouchEnd:function(e){window.clearTimeout(this.$15);this.$14=false;},handleTouchCancel:function(e){window.clearTimeout(this.$15);this.$14=false;},$1E:function($p0){if(!this.$1C($p0)&&!this.$14){return;}this.$12=$p0.srcElement;Array.clear(this.$5);this.$11=null;if($p0.type==='pps-contextmenu'){this.$F=$p0;var $2=$p0;PPSMA.ContextMenu.create($2.uiReferenceElement,this,$2.offsetX,$2.offsetY,false);return;}var $0=this.$1D($p0);var $1=PPSMA.OlapChart.$1B($p0.srcElement);this.$F=(PPSMA.$create_ChartDomEvent($p0.button,$0.x,$0.y,this.$12,$1));PPSMA.ContextMenu.create($1,this,$0.x,$0.y,false);},addPrimaryMenuItems:function(m){this.$6=m;switch(this.$D){case 0:return this.$1F();case 1:return this.$20();case 2:return this.$21();case 3:return this.$22();case 4:return this.$23();case 5:return this.$24(this.$6);default:break;}return false;},$1F:function(){var $0=this.$2D();var $1=this.$2E();var $2=new PPSMA.MenuOptionHelper($0,$1,this.get_$37(),this.$3);var $3=(this.$B.length>1);if(this.get_$37()&&$3){$2.addDisabledOption(this.$6,this.$B[this.$9],false);}$2.drillDown(this.$6,this.$2+'.drillDown()',$3);var $4=$2.drillDownTo(this.$6,this.$2+'.fetchCallback('+this.$5.length+')',this.$2+'.populateCallback('+this.$5.length+')',this.$2+'.hoverOffCallback('+this.$5.length+')',$3);if($4){var $5=new PPSMA.SubMenu($4,0);Array.add(this.$5,$5);}$2.drillUp(this.$6,this.$2+'.drillUp()',$3);$2.showOnly(this.$6,this.$2+'.showOnly()',$3);$2.remove(this.$6,this.$2+'.remove()',$3);if(this.get_$37()){$2.showChangeMeasure(this.$6,this.$2+'.selectMeasures()',this.get_$38(),$3);}for(var $6=0;$6<this.$B.length;$6++){if($6!==this.$9){$2.switchToOption(this.$6,this.$B[$6],this.$2+'.switchTo('+$6+')',false);}}PPSMA.ContextMenu.addMenuSeparator(this.$6);this.$30(this.get_$37(),true,false);$2.pivot(this.$6,this.$2+'.pivot()',false);PPSMA.ContextMenu.addMenuSeparator(this.$6);if(this.get_$37()){$2.reportTypeSubMenu(this.$6,this.$2,this.$4[0]);var $7=$2.formatReportSubMenu(this.$6,false);this.$24($7);PPSMA.ContextMenu.addMenuSeparator(this.$6);}$2.showHideInfo(this.$6,this.$2+'.showHideInfo()',false);return ($2.get_optionsAdded()>0);},$20:function(){var $0=this.$2D();var $1=this.$2E();var $2=new PPSMA.MenuOptionHelper($0,$1,this.get_$37(),this.$3);if(this.get_$37()){if(!this.$E){$2.addDisabledOption(this.$6,this.$B[this.$9],false);}else{$2.addDisabledOption(this.$6,this.$C[this.$A],false);}}$2.drillDown(this.$6,this.$2+'.drillDown()',true);var $3=$2.drillDownTo(this.$6,this.$2+'.fetchCallback('+this.$5.length+')',this.$2+'.populateCallback('+this.$5.length+')',this.$2+'.hoverOffCallback('+this.$5.length+')',true);if($3){var $4=new PPSMA.SubMenu($3,0);Array.add(this.$5,$4);}$2.drillUp(this.$6,this.$2+'.drillUp()',true);$2.showOnly(this.$6,this.$2+'.showOnly()',true);$2.remove(this.$6,this.$2+'.remove()',true);if(this.get_$37()){$2.showChangeMeasure(this.$6,this.$2+'.selectMeasures()',this.get_$38(),true);}for(var $5=0;$5<this.$B.length;$5++){if($5!==this.$9||this.$E===1){$2.switchToOption(this.$6,this.$B[$5],this.$2+'.switchTo('+$5+')',false);}}for(var $6=0;$6<this.$C.length;$6++){if($6!==this.$A||!this.$E){$2.switchToOption(this.$6,this.$C[$6],this.$2+'.switchTo('+$6+',true)',false);}}if(!this.get_$38()){PPSMA.ContextMenu.addMenuSeparator(this.$6);$2.decompositionTree(this.$6,this.$2+'.analyzeInDecompositionTree(\'\');',false,true,this.get_$38());var $7=true;var $8=$2.hasAggregatedBackGroundHierarchies();if($8){$7=false;}$2.showDetails(this.$6,this.$2+'.showDetails(\'\')',false,$7);var $9=true;if($8){$9=false;}this.$3.set_cellActionData(null);var $A=$2.additionalActions(this.$6,this.$2+'.fetchCallback('+this.$5.length+')',this.$2+'.populateCallback('+this.$5.length+')',this.$2+'.hoverOffCallback('+this.$5.length+')',false,$9);if($A){var $B=new PPSMA.SubMenu($A,1);Array.add(this.$5,$B);}}PPSMA.ContextMenu.addMenuSeparator(this.$6);this.$31(this.get_$37());this.$30(this.get_$37(),true,true);$2.pivot(this.$6,this.$2+'.pivot()',false);PPSMA.ContextMenu.addMenuSeparator(this.$6);$2.showHideInfo(this.$6,this.$2+'.showHideInfo();',false);return ($2.get_optionsAdded()>0);},$21:function(){var $0=this.$2D();var $1=this.$2E();var $2=new PPSMA.MenuOptionHelper($0,$1,this.get_$37(),this.$3);var $3=(this.$C.length>1);if(this.get_$37()&&$3){$2.addDisabledOption(this.$6,this.$C[this.$A],false);}$2.drillDown(this.$6,this.$2+'.drillDown()',$3);var $4=$2.drillDownTo(this.$6,this.$2+'.fetchCallback('+this.$5.length+')',this.$2+'.populateCallback('+this.$5.length+')',this.$2+'.hoverOffCallback('+this.$5.length+')',$3);if($4){var $5=new PPSMA.SubMenu($4,0);Array.add(this.$5,$5);}$2.drillUp(this.$6,this.$2+'.drillUp()',$3);$2.showOnly(this.$6,this.$2+'.showOnly()',$3);$2.remove(this.$6,this.$2+'.remove()',$3);if(this.get_$37()){$2.showChangeMeasure(this.$6,this.$2+'.selectMeasures()',this.get_$38(),$3);}for(var $6=0;$6<this.$C.length;$6++){if($6!==this.$A){$2.switchToOption(this.$6,this.$C[$6],this.$2+'.switchTo('+$6+',true)',false);}}PPSMA.ContextMenu.addMenuSeparator(this.$6);this.$30(this.get_$37(),false,true);$2.pivot(this.$6,this.$2+'.pivot()',false);PPSMA.ContextMenu.addMenuSeparator(this.$6);if(this.get_$37()){$2.reportTypeSubMenu(this.$6,this.$2,this.$4[0]);var $7=$2.formatReportSubMenu(this.$6,false);this.$24($7);PPSMA.ContextMenu.addMenuSeparator(this.$6);}$2.showHideInfo(this.$6,this.$2+'.showHideInfo()',false);return ($2.get_optionsAdded()>0);},$22:function(){var $0=new PPSMA.MenuOptionHelper(null,null,this.get_$37(),this.$3);if(this.get_$37()){$0.showChangeMeasure(this.$6,this.$2+'.selectMeasures()',this.get_$38(),false);}PPSMA.ContextMenu.addMenuSeparator(this.$6);this.$30(this.get_$37(),true,true);$0.pivot(this.$6,this.$2+'.pivot()',false);PPSMA.ContextMenu.addMenuSeparator(this.$6);$0.reportTypeSubMenu(this.$6,this.$2,this.$4[0]);if(this.get_$37()){var $1=$0.formatReportSubMenu(this.$6,false);this.$24($1);PPSMA.ContextMenu.addMenuSeparator(this.$6);}$0.showHideInfo(this.$6,this.$2+'.showHideInfo();',false);return ($0.get_optionsAdded()>0);},$23:function(){var $0=new PPSMA.MenuOptionHelper(null,null,this.get_$37(),this.$3);$0.showHideInfo(this.$6,this.$2+'.showHideInfoByDiv();',false);return ($0.get_optionsAdded()>0);},$24:function($p0){PPSMA.ContextMenu.addMenuOption($p0,PPSMA.SR.OlapContextMenu_ChartLegendRight,this.$2+'.showLegendAtRight()',this.$3.get_resourcePath()+'LegendRight.gif',null,(this.$4[1]===1),false);PPSMA.ContextMenu.addMenuOption($p0,PPSMA.SR.OlapContextMenu_ChartLegendTop,this.$2+'.showLegendAtTop()',this.$3.get_resourcePath()+'LegendTop.gif',null,(this.$4[1]===2),false);var $0=this.$2+'.hideLegend()';if(!this.$4[1]){$0='';}PPSMA.ContextMenu.addMenuOption($p0,PPSMA.SR.OlapContextMenu_ChartLegendHide,$0,null,null,false,false);return true;},drillDownTo:function(drillToHierarchyName,drillToMemberName,drillToLevelName){var $0=this.$2D();var $1=this.$2E();this.$3.crossDrill($1.get_name(),$0.get_name(),unescape(drillToHierarchyName),unescape(drillToMemberName),unescape(drillToLevelName));},drillDown:function(){var $0=this.$2D();var $1=this.$2E();this.$3.drillDown($1.get_name(),$0.get_name());},drillUp:function(){var $0=this.$2D();var $1=this.$2E();this.$3.drillUp($1.get_name(),$0.get_name());},showOnly:function(){var $0=this.$2D();var $1=this.$2E();this.$3.showOnly($1.get_name(),$0.get_name());},remove:function(){var $0=this.$2D();var $1=this.$2E();this.$3.hide($1.get_name(),$0.get_name());},selectMeasures:function(){this._changeMeasure.show(this.$12);},sort:function(axis,sortType){var $0=new PPSMA.DetailsHelper(this.$3,this.$2,this.$7,this.$8,null);var $1=$0.getCellTupleXml();if($1){this.$3.sort(axis,$1,sortType,'false');}},pivot:function(){this.$3.pivot();},handleMeasureGroupNameChange:function(){var $0='window.event.srcElement.id';var $1=eval($0);var $2=$get($1);if($2){var $3=$2.getAttribute('MeasureGroupName');this.$3.get_measures().set_measureGroupName($3);}},filterByValue:function(axis){var $0;if(axis==='1'){$0=this.$3.get_results().get_valueFilterParamsCol();}else{$0=this.$3.get_results().get_valueFilterParamsRow();}var $1=null;this._valueFilter.set_selectedButton('2');if($0&&$0!==''){$1=$0.split(';');}var $2=0;if($1&&$1[0]!=='0'){$2=parseInt($1[0]);}this._valueFilter.setCallbackMethod(Function.createDelegate(this,this.processFilterDialogResult));if($2>6&&$1){this._valueFilter.set_hierarchyName($1[1]);this._valueFilter.set_filterType($2);this._valueFilter.set_value1($1[3]);this._valueFilter.set_value2($1[4]);this._valueFilter.set_currentCell(null);this._valueFilter.set_axis(axis);var $3=$1[2];this._valueFilter.set_levelName($1[5]);this._valueFilter.loadFilterDialog($1[0],$3,$1[5],this._valueFilter.get_hierarchyName(),this._valueFilter.get_value1(),this._valueFilter.get_value2(),null,axis);}else{var $4=this.$2F(axis);this._valueFilter.set_hierarchyName($4.get_name());this._valueFilter.set_filterType(9);this._valueFilter.set_showClearOption(false);this._valueFilter.set_tupleIndex(((axis==='1')?this.$7:this.$8));this._valueFilter.set_value1('0');this._valueFilter.set_value2('100');this._valueFilter.set_currentCell(null);this._valueFilter.set_axis(axis);this._valueFilter.set_innerTargetID(this.$3.get_innerTargetId());this._valueFilter.showValueFilterDlg();}},processFilterDialogResult:function(){if(this._valueFilter.get_selectedButton()==='1'){this.$3.filter(this._valueFilter.get_filterType().toString(),this._valueFilter.get_hierarchyName(),this._valueFilter.get_tupleXML(),this._valueFilter.get_axis(),this._valueFilter.get_levelName(),this._valueFilter.get_value1(),this._valueFilter.get_value2());}else if(this._valueFilter.get_selectedButton()==='3'){this.$3.clearFilter(this._valueFilter.get_axis(),(this._valueFilter.get_axis()==='1'));}},filterByTopBottom:function(axis){var $0;if(axis==='1'){$0=this.$3.get_results().get_valueFilterParamsCol();}else{$0=this.$3.get_results().get_valueFilterParamsRow();}var $1=null;this._valueFilter.set_selectedButton('2');if($0&&$0!==''){$1=$0.split(';');}var $2=0;if($1&&$1[0]!=='0'){$2=parseInt($1[0]);}this._valueFilter.setCallbackMethod(Function.createDelegate(this,this.processFilterDialogResult));if($2>0&&$2<7&&$1){this._valueFilter.set_hierarchyName($1[1]);this._valueFilter.set_filterType($2);this._valueFilter.set_tupleIndex(((axis==='1')?this.$7:this.$8));this._valueFilter.set_value1($1[3]);this._valueFilter.set_value2($1[4]);this._valueFilter.set_currentCell(null);this._valueFilter.set_axis(axis);var $3=$1[2];this._valueFilter.set_levelName($1[5]);this._valueFilter.loadFilterDialog($1[0],$1[5],$3,this._valueFilter.get_hierarchyName(),this._valueFilter.get_value1(),this._valueFilter.get_value2(),null,axis);}else{var $4=this.$2F(axis);this._valueFilter.set_hierarchyName($4.get_name());this._valueFilter.set_filterType(1);this._valueFilter.set_showClearOption(false);this._valueFilter.set_tupleIndex(((axis==='1')?this.$7:this.$8));this._valueFilter.set_value1('10');this._valueFilter.set_currentCell(null);this._valueFilter.set_axis(axis);this._valueFilter.set_innerTargetID(this.$3.get_innerTargetId());this._valueFilter.showTopFilterDlg();}},loadFilterDialog:function(sFilterTypeIndex,hierarchy,tuple,level,value1,value2,axis){this._valueFilter.setCallbackMethod(Function.createDelegate(this,this.processFilterDialogResult));this._valueFilter.loadFilterDialog(sFilterTypeIndex,tuple,level,hierarchy,value1,value2,null,axis);},filterEmptyRow:function(){var $0=(this.$3.get_results().get_filterEmptyAxis()&2)>0;this.$3.filterEmpty('2',!$0);},filterEmptyCol:function(){var $0=(this.$3.get_results().get_filterEmptyAxis()&1)>0;this.$3.filterEmpty('1',!$0);},clearSeriesFilter:function(){this.$3.clearFilter('2',false);},clearPointsFilter:function(){this.$3.clearFilter('1',true);},switchSeriesEvnt:function(){this.sOnC(this.$F,null);},switchPointsEvnt:function(){this.pOnC(this.$F,null);},switchCategoryEvnt:function(){this.xOnC(this.$F,null);},switchTo:function(ndx,isAxisX){if(!PPSMA.OlapChart.$1){PPSMA.OlapChart.$1={};}switch(this.$D){case 0:this.$9=ndx;window.setTimeout(this.$2+'.switchSeriesEvnt()',100);break;case 1:if(isAxisX){this.$A=ndx;this.$E=1;}else{this.$9=ndx;this.$E=0;}PPSMA.OlapChart.$1[this.$2]=this.$E;window.setTimeout(this.$2+'.switchPointsEvnt()',100);break;case 2:this.$A=ndx;this.$9=ndx;window.setTimeout(this.$2+'.switchCategoryEvnt()',100);break;default:break;}},fetchCallback:function(smIndex){var $0=this.$5[smIndex];if($0){$0.set_hoverOn(true);switch($0.get_menuType()){case 1:if(!this.$3.get_cellActionData()&&!this.$25){this.$25=true;var $1=new PPSMA.DetailsHelper(this.$3,this.$2,this.$7,this.$8,'');var $2=$1.getCellTupleXml();this.$3.getCellLevelActions($2);}break;case 0:if(!this.$3.get_cubeMetadata()){this.$3.loadCubeMetadata(this.$3.get_ctrlProxyId());}break;default:$0.set_hoverOn(false);break;}}},$25:false,populateCallback:function(smIndex){var $0=this.$5[smIndex];if($0&&$0.get_hoverOn()){var $1=$0.get_menu();var $2=$0.get_isPopulated();if(!$2){PPSMA.ContextMenu.removeAllButFirst($1);switch($0.get_menuType()){case 1:if(this.$3.get_cellActionData()){this.$25=false;this.$33($1);$0.set_isPopulated(true);}break;case 0:if(this.$3.get_cubeMetadata()){this.$34($1);$0.set_isPopulated(true);}break;default:break;}}if($2){PPSMA.ContextMenu.refreshMenu($1,false);}else if($0.get_isPopulated()){PPSMA.ContextMenu.refreshMenu($1,true);}}},hoverOffCallback:function(smIndex){var $0=this.$5[smIndex];if($0){$0.set_hoverOn(false);}},switchToGrid:function(){this.$13=0;this.$3.switchOlapReportType((0),Function.createDelegate(this,this.switchReportTypeCompleted));},switchToColumnChart:function(){this.$13=1;this.$3.switchOlapReportType((1),Function.createDelegate(this,this.switchReportTypeCompleted));},switchToColumnChartStacked:function(){this.$13=2;this.$3.switchOlapReportType((2),Function.createDelegate(this,this.switchReportTypeCompleted));},switchToColumnChartStacked100:function(){this.$13=3;this.$3.switchOlapReportType((3),Function.createDelegate(this,this.switchReportTypeCompleted));},switchToLineChart:function(){this.$13=4;this.$3.switchOlapReportType((4),Function.createDelegate(this,this.switchReportTypeCompleted));},switchToLineChartWithMarkers:function(){this.$13=5;this.$3.switchOlapReportType((5),Function.createDelegate(this,this.switchReportTypeCompleted));},switchToPieChart:function(){this.$13=6;this.$3.switchOlapReportType((6),Function.createDelegate(this,this.switchReportTypeCompleted));},switchReportTypeCompleted:function(success){if(success){this.$4[0]=this.$13;}},showLegendLocMenu:function(e){this.$D=5;var $0=PPSMA.EventsEx.getCurrentElement(e);this.$12=$0.parentNode.parentNode;var $1=0;var $2=this.$12.offsetHeight;PPSMA.ContextMenu.create(this.$12,this,$1,$2,false);},showLegendAtRight:function(){this.$13=1;this.$3.changeViewConfigurationWithCallback('LegendLocation',(1).toString(),Function.createDelegate(this,this.legendCompleted));},showLegendAtTop:function(){this.$13=2;this.$3.changeViewConfigurationWithCallback('LegendLocation',(2).toString(),Function.createDelegate(this,this.legendCompleted));},hideLegend:function(){this.$13=0;this.$3.changeViewConfigurationWithCallback('LegendLocation',(0).toString(),Function.createDelegate(this,this.legendCompleted));},legendCompleted:function(success){if(success){this.$4[1]=this.$13;}},showHideInfoByDiv:function(){this.$3.toggleViewInfoBar(this.$12.firstChild);},hideViewInfoBarCtxMenu:function(e){var $0=PPSMA.EventsEx.getEvent(e);var $1=PPSMA.EventsEx.getCurrentElement(e);if(PPSMA.OlapChart.$36($0)){this.$D=4;this.$12=PPSMA.OlapViewContext.getViewInfoDiv($1);Array.clear(this.$5);this.$11=null;var $2;var $3;if(isNullOrUndefined($0.offsetX)){$2=PPSMA.SizeEx.getXOffset($0,this.$12);$3=PPSMA.SizeEx.getYOffset($0,this.$12);}else{$2=$0.offsetX;$3=$0.offsetY;}PPSMA.ContextMenu.create($1,this,$2,$3,false);}},assignFocus:function(){var $0=$get(this.$3.get_innerTargetId());if($0){$0.firstChild.firstChild.focus();}},showHideInfo:function(){var $0=null;var $1=this.$12;while($1){if(PPSMA.DomElementEx.tagsMatch($1.tagName,'map')){$0=$1;break;}$1=$1.parentNode;}var $2=null;if($0){var $3=$0.parentNode.parentNode;$1=$3.firstChild;while($1){if(PPSMA.DomElementEx.tagsMatch($1.tagName,'div')&&($1.id==='_viewInfoId')){$2=$1;break;}$1=$1.nextSibling;}}if($2){this.$3.toggleViewInfoBar($2.firstChild);}},handleShowUrlMenuClick:function(urlContent){var $0=window.self.screen;var $1=parseInt(($0.availWidth-800)/2);var $2=parseInt(($0.availHeight-400)/2);var $3=window.open(urlContent,'URLWindow','left='+$1+',top='+$2+',height=400'+',width=800'+',menubar,toolbar,titlebar,status,location,resizable,scrollbars');if($3){$3.focus();}},showDetails:function(resultTableIndex){var $0=new PPSMA.DetailsHelper(this.$3,this.$2,this.$7,this.$8,resultTableIndex);$0.showDetails();},analyzeInDecompositionTree:function(misc){var $0=new PPSMA.AnalyzeInDecompHelper();$0.launchAnalyzeRequest(this.$3,this.$2,this.$7,this.$8);},get_cubeMetadata:function(){return null;},set_cubeMetadata:function(value){return value;},$26:function($p0,$p1){this.$2A($p0);switch($p1){case 0:this.$2B();break;case 1:this.$2B();this.$2C();break;case 2:this.$2C();break;}},$27:function(){if(PPSMA.OlapChart.$1&&PPSMA.OlapChart.$1[this.$2]){this.$E=PPSMA.OlapChart.$1[this.$2];}},$28:function($p0){switch(this.$29()){case 0:this.sOnC($p0,this.$11);break;case 1:this.pOnC($p0,this.$11);break;case 2:this.xOnC($p0,this.$11);break;}},$29:function(){var $0;if(this.$11[0]<0){$0=2;}else if(this.$11[1]<0){$0=0;}else{$0=1;}return $0;},$2A:function($p0){if($p0&&$p0.length===2){this.$7=$p0[0];this.$8=$p0[1];}},$2B:function(){this.$B=[];var $0=this.$3.get_results().get_rowMembers()[this.$7];for(var $1=0;$1<$0.length;$1++){Array.add(this.$B,$0[$1].get_caption());}},$2C:function(){this.$C=[];var $0=this.$3.get_results().get_columnMembers()[this.$8];for(var $1=0;$1<$0.length;$1++){Array.add(this.$C,$0[$1].get_caption());}},$2D:function(){if(!this.$D||!this.$E){var $0=this.$3.get_results().get_rowMembers();return $0[this.$7][this.$9];}else if(this.$D===1){var $1=this.$3.get_results().get_columnMembers();return $1[this.$8][this.$A];}else if(this.$D===2){var $2=this.$3.get_results().get_columnMembers();return $2[this.$8][this.$9];}return null;},$2E:function(){if(!this.$D||!this.$E){var $0=this.$3.get_results().get_rowHierarchies();return $0[this.$9];}else if(this.$D===1){var $1=this.$3.get_results().get_columnHierarchies();return $1[this.$A];}else if(this.$D===2){var $2=this.$3.get_results().get_columnHierarchies();return $2[this.$A];}return null;},$2F:function($p0){if($p0==='2'){var $0=this.$3.get_results().get_rowHierarchies();return $0[this.$9];}else if($p0==='1'){var $1=this.$3.get_results().get_columnHierarchies();return $1[this.$A];}return null;},$30:function($p0,$p1,$p2){if($p0){var $0=this.$3.get_results().get_filterEmptyAxis();var $1=(($0&2)>0);var $2=(($0&1)>0);var $3=PPSMA.ContextMenu.addSubMenu(this.$6,PPSMA.SR.OlapContextMenu_Filter,this.$3.get_resourcePath()+'ImageFilter.gif',false);if($p1){var $4=(this.$3.get_results().get_valueFilterRow()===1);var $5=(this.$3.get_results().get_topFilterRow()===1);PPSMA.ContextMenu.addDisabledMenuOption($3,PPSMA.SR.OlapContextMenu_SortSeries,null,this.$3.get_resourcePath()+'ChartSeriesD.gif',false);if($4||$5){PPSMA.ContextMenu.addMenuOption($3,PPSMA.SR.OlapContextMenu_ClearFilter,this.$2+'.clearSeriesFilter()',this.$3.get_resourcePath()+'ClearFilter.gif',null,false,true);}else{PPSMA.ContextMenu.addDisabledMenuOption($3,PPSMA.SR.OlapContextMenu_ClearFilter,null,this.$3.get_resourcePath()+'ClearFilterD.gif',true);}PPSMA.ContextMenu.addMenuOption($3,PPSMA.SR.OlapContextMenu_ValueFilter,this.$2+'.filterByValue(\'2\');',(($4)?this.$3.get_resourcePath()+'Check.gif':''),null,false,true);PPSMA.ContextMenu.addMenuOption($3,PPSMA.SR.OlapContextMenu_TopFilter,this.$2+'.filterByTopBottom(\'2\');',(($5)?this.$3.get_resourcePath()+'Check.gif':''),null,false,true);}if($p2){var $6=(this.$3.get_results().get_valueFilterCol()===1);var $7=(this.$3.get_results().get_topFilterCol()===1);if($p1){PPSMA.ContextMenu.addMenuSeparator($3);}PPSMA.ContextMenu.addDisabledMenuOption($3,PPSMA.SR.OlapContextMenu_SortPoints,null,this.$3.get_resourcePath()+'ChartBottomAxisD.gif',false);if($6||$7){PPSMA.ContextMenu.addMenuOption($3,PPSMA.SR.OlapContextMenu_ClearFilter,this.$2+'.clearPointsFilter()',this.$3.get_resourcePath()+'ClearFilter.gif',null,false,true);}else{PPSMA.ContextMenu.addDisabledMenuOption($3,PPSMA.SR.OlapContextMenu_ClearFilter,null,this.$3.get_resourcePath()+'ClearFilterD.gif',true);}PPSMA.ContextMenu.addMenuOption($3,PPSMA.SR.OlapContextMenu_ValueFilter,this.$2+'.filterByValue(\'1\');',(($6)?this.$3.get_resourcePath()+'Check.gif':''),null,false,true);PPSMA.ContextMenu.addMenuOption($3,PPSMA.SR.OlapContextMenu_TopFilter,this.$2+'.filterByTopBottom(\'1\');',(($7)?this.$3.get_resourcePath()+'Check.gif':''),null,false,true);}PPSMA.ContextMenu.addMenuSeparator($3);if($p1){PPSMA.ContextMenu.addToggleMenuOption($3,PPSMA.SR.OlapContextMenu_EmptySeries,this.$2+'.filterEmptyRow()',this.$3.get_resourcePath()+'FilterEmpRowChart.gif',null,$1,false);}if($p2){PPSMA.ContextMenu.addToggleMenuOption($3,PPSMA.SR.OlapContextMenu_EmptyPoints,this.$2+'.filterEmptyCol()',this.$3.get_resourcePath()+'FilterEmpColChart.gif',null,$2,false);}}},$31:function($p0){if($p0){var $0=(this.$8===this.$3.get_results().get_sortColIndex());var $1=(this.$7===this.$3.get_results().get_sortRowIndex());var $2=PPSMA.ContextMenu.addSubMenu(this.$6,PPSMA.SR.OlapContextMenu_Sort,this.$3.get_resourcePath()+'Sort.gif',false);PPSMA.ContextMenu.addDisabledMenuOption($2,PPSMA.SR.OlapContextMenu_SortSeries,null,this.$3.get_resourcePath()+'ChartSeriesD.gif',false);PPSMA.ContextMenu.addMenuOption($2,PPSMA.SR.OlapContextMenu_LargeToSmall,this.$2+'.sort(\'2\',\'desc\')',this.$3.get_resourcePath()+'SortAscNum.gif',null,$0&&(this.$3.get_results().get_sortTypeRow()==='desc'),true);PPSMA.ContextMenu.addMenuOption($2,PPSMA.SR.OlapContextMenu_SmallToLarge,this.$2+'.sort(\'2\',\'asc\');',this.$3.get_resourcePath()+'SortDescNum.gif',null,$0&&(this.$3.get_results().get_sortTypeRow()==='asc'),true);PPSMA.ContextMenu.addMenuOption($2,PPSMA.SR.OlapContextMenu_NoSort,this.$2+'.sort(\'2\',\'nosort\');',null,null,false,true);PPSMA.ContextMenu.addMenuSeparator($2);PPSMA.ContextMenu.addDisabledMenuOption($2,PPSMA.SR.OlapContextMenu_SortPoints,null,this.$3.get_resourcePath()+'ChartBottomAxisD.gif',false);PPSMA.ContextMenu.addMenuOption($2,PPSMA.SR.OlapContextMenu_LargeToSmall,this.$2+'.sort(\'1\',\'desc\');',this.$3.get_resourcePath()+'SortAscNum.gif',null,$1&&(this.$3.get_results().get_sortTypeCol()==='desc'),true);PPSMA.ContextMenu.addMenuOption($2,PPSMA.SR.OlapContextMenu_SmallToLarge,this.$2+'.sort(\'1\',\'asc\');',this.$3.get_resourcePath()+'SortDescNum.gif',null,$1&&(this.$3.get_results().get_sortTypeCol()==='asc'),true);PPSMA.ContextMenu.addMenuOption($2,PPSMA.SR.OlapContextMenu_NoSort,this.$2+'.sort(\'1\',\'nosort\');',null,null,false,true);}},$32:function($p0){var $0=this.$2D();return ((!$p0||PPSMA.OlapChart.$35($p0))&&this.get_$37()&&$0.get_hasChildren());},$33:function($p0){var $0=PPSMA.XmlEx.loadXml(this.$3.get_cellActionData());var $1=$0.getElementsByTagName('UrlAction');if(($1)&&($1.length>0)){for(var $3=0;$3<$1.length;$3++){PPSMA.ContextMenu.addMenuOption($p0,$1[$3].getAttribute('caption'),this.$2+'.handleShowUrlMenuClick(\''+$1[$3].getAttribute('content')+'\');',null,null,false,false);}}var $2=$0.getElementsByTagName('DDAction');if(($2)&&($2.length>0)){for(var $4=0;$4<$2.length;$4++){PPSMA.ContextMenu.addMenuOption($p0,$2[$4].getAttribute('caption'),this.$2+'.showDetails(\''+$2[$4].getAttribute('resulttableindex')+'\');',null,null,false,false);}}else{var $5=$0.getElementsByTagName('AdditionalActions');if($5){PPSMA.ContextMenu.addDisabledMenuOption($p0,$5[0].getAttribute('message'),null,null,false);}}},$34:function($p0){var $0=this.$2D();var $1=this.$2E();if(($0)&&($1)){var $2='R';if((this.$D===1&&this.$E===1)||(this.$D===2)){$2='C';}var $3=new PPSMA.DrillDownToHelper($0,$1,$2,this.$3);$3.populateSubMenuItems($p0,this.$2+'.drillDownTo');}},get_$37:function(){return this.$3.get_results().get_canNavigate();},get_$38:function(){return this.$3.get_results().get_isDesigner();}}
PPSMA.ChartDomEventTypes.registerClass('PPSMA.ChartDomEventTypes');PPSMA.OlapChart.registerClass('PPSMA.OlapChart',null,PPSMA.OlapView);PPSMA.ChartDomEventTypes.ppsContextMenu='pps-contextmenu';PPSMA.OlapChart.$1=null;PPSMA.OlapChart.$17=40;PPSMA.OlapChart.$18=40;
// ---- Do not remove this footer ----
// Generated using Script# v0.5.0.0 (http://projects.nikhilk.net)
// -----------------------------------

if(typeof(Sys)!=='undefined')Sys.Application.notifyScriptLoaded();