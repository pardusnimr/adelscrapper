﻿
Type.registerNamespace('PPSMA');PPSMA.ReportLayoutEnum=function(){};PPSMA.ReportLayoutEnum.prototype = {TabularForm:0,CompactForm:1}
PPSMA.ReportLayoutEnum.registerEnum('PPSMA.ReportLayoutEnum',false);PPSMA.OlapGrid=function(gridCtxName,olapViewContext,isDefaultGridStyle){this.$0=gridCtxName;this.$1=null;this.$2='';this.$3=olapViewContext;this.$4=[];this.$5=false;this.$6=false;this.$7=null;this.$8=1;this._showProperties=new PPSMA.ShowProperties(this.$0,this.$3);this._changeMeasure=new PPSMA.ChangeMeasure(this.$0,this.$3);this._valueFilter=new PPSMA.FilterDialog(this.$3,this.$0);this.$9=isDefaultGridStyle;if(this.$3){var $0=$get(this.$3.get_outerTargetId());Sys.UI.DomEvent.clearHandlers($0);this.$1D(null,this.$3);Sys.UI.DomEvent.addHandler($0,'propertychange',Function.createDelegate(this,this.$14));}Sys.UI.DomEvent.addHandler(document.body,'touchstart',Function.createDelegate(this,function($p1_0){
}));}
PPSMA.OlapGrid.$17=function($p0,$p1){var $0=0;var $1=0;var $2=$p0.firstChild;while($2&&$1<$p1){$1+=parseInt($2.getAttribute('colspan'));if($1<=$p1){$0++;}$2=$2.nextSibling;}return $0;}
PPSMA.OlapGrid.$39=function($p0){var $0=null;if(($p0)&&($p0.tagName)){if(PPSMA.DomElementEx.tagsMatch($p0.tagName,'td')){$0=$p0;}else if(PPSMA.DomElementEx.tagsMatch($p0.tagName,'img')||PPSMA.DomElementEx.tagsMatch($p0.tagName,'a')){var $1=$p0.parentNode;while(($1)&&($1.tagName)){if(PPSMA.DomElementEx.tagsMatch($1.tagName,'a')&&PPSMA.DomElementEx.tagsMatch($1.className,'excoA')){$0=$1.parentNode;break;}else if(PPSMA.DomElementEx.tagsMatch($1.tagName,'img')||PPSMA.DomElementEx.tagsMatch($1.tagName,'a')){$1=$p0.parentNode;}if(PPSMA.DomElementEx.tagsMatch($1.tagName,'td')){$0=$1;break;}else{$0=null;break;}}}}return $0;}
PPSMA.OlapGrid.$3A=function(){var $0=window.document.styleSheets;var $1=true;var $2=$0[0].cssRules;if(isNullOrUndefined($2)){$1=false;}return $1;}
PPSMA.OlapGrid.$3B=function($p0){var $0=window.document.styleSheets;var $1=$0.length;for(var $2=0;$2<$1;$2++){var $3=$0[$2].href;if(!isNullUndefinedOrEmpty($3)&&$3.endsWith($p0)){return $0[$2];}}return null;}
PPSMA.OlapGrid.$3C=function($p0,$p1,$p2){var $0=PPSMA.OlapGrid.$3A();var $1;if($0){$1=$p0.cssRules;}else{$1=$p0.rules;}for(var $2=0;$2<$1.length;$2++){if(($1[$2].selectorText).toLowerCase()===$p1.toLowerCase()){if($0){$p0.deleteRule($2);$1=$p0.cssRules;}else{$p0.removeRule($2);}break;}}if($0){var $3=$p1+' {';$3+=$p2;$3+='}';$p0.insertRule($3,$1.length);}else{$p0.addRule($p1,$p2);}}
PPSMA.OlapGrid.prototype={$0:null,$1:null,$2:null,$3:null,$4:null,$5:false,$6:false,$7:null,$8:0,_showProperties:null,_changeMeasure:null,_valueFilter:null,$9:false,$E:0,$F:0,$10:0,$11:null,$14:function($p0){var $0='window.event.propertyName';var $1=eval($0);switch($1){case 'executeValueFilterRow':this.handleValueFilterMenuClick();break;case 'executeTopFilterRow':this.handleTopFilterMenuClick();break;case 'clearFilterRow':this.handleClearFilterMenuClick();break;case 'filterEmptyRows':this.$32();break;case 'filterEmptyCols':this.$33();break;case 'sortAscRow':this.handleSortMenuClick('asc');break;case 'sortDescRow':this.handleSortMenuClick('desc');break;case 'noSortRow':this.handleSortMenuClick('nosort');break;case 'MeasureGroupName':this.handleMeasureGroupNameChange();break;}},get_isDefaultGridStyle:function(){return this.$9;},get_reportLayout:function(){return this.$8;},set_reportLayout:function(value){this.$8=value;return value;},get_cubeMetadata:function(){return null;},set_cubeMetadata:function(value){return value;},get_$15:function(){return this.$3.get_results().get_canNavigate();},get_$16:function(){return this.$3.get_results().get_isDesigner();},$18:function($p0){var $0=null;if($p0){var $1=PPSMA.ReportsCommon.getCellRowPosition($p0);var $2=PPSMA.ReportsCommon.getCellColumnPosition($p0);if(($1!==-1)&&($2!==-1)){var $3=PPSMA.ReportsCommon.getCellTypeId($p0);switch($3){case 'R':var $4=this.$3.get_results().get_rowMembers();$0=$4[$1][$2];break;case 'C':var $5=this.$3.get_results().get_columnMembers();$0=$5[$2][$1];break;case 'D':case 'P':break;}}}return $0;},$19:function($p0){var $0=null;if($p0){var $1=PPSMA.ReportsCommon.getCellRowPosition($p0);var $2=PPSMA.ReportsCommon.getCellColumnPosition($p0);if(($1!==-1)&&($2!==-1)){var $3;var $4=PPSMA.ReportsCommon.getCellTypeId($p0);switch($4){case 'R':$3=this.$1A(this.$3.get_results().get_rowHierarchies(),this.$3.get_formatDimHierarchyName());if($3>=0){var $5=this.$3.get_results().get_rowMembers();$0=$5[$1][$3];}break;case 'C':$3=this.$1A(this.$3.get_results().get_columnHierarchies(),this.$3.get_formatDimHierarchyName());if($3>=0){var $6=this.$3.get_results().get_columnMembers();$0=$6[$2][$3];}break;case 'D':$3=this.$1A(this.$3.get_results().get_columnHierarchies(),this.$3.get_formatDimHierarchyName());if($3>=0){var $7=this.$3.get_results().get_columnMembers();$0=$7[$2][$3];}else{$3=this.$1A(this.$3.get_results().get_rowHierarchies(),this.$3.get_formatDimHierarchyName());if($3>=0){var $8=this.$3.get_results().get_rowMembers();$0=$8[$1][$3];}}break;case 'P':break;}}}return $0;},$1A:function($p0,$p1){var $0=-1;for(var $1=0;$1<$p0.length;$1++){var $2=$p0[$1];if($2.get_name()===$p1){$0=$1;break;}}return $0;},$1B:function($p0){if($p0){var $0=this.$19($p0);if($0){this.$3.setOuterTagAttribute('selectedFormatMember',$0.get_name());}}},$1C:function($p0){if(this.$1){this.$1.style.backgroundColor=this.$2;}this.$2=$p0.style.backgroundColor;$p0.style.backgroundColor='#FEE197';this.$1=$p0;this.$1B($p0);this.$1D($p0,this.$3);},$1D:function($p0,$p1){if($p1&&$p1.get_results()){var $0;if(this.get_$15()){var $1='D';$0='row:{0};col:{1};emptyrow:{2};emptycol:{3};sortrow:{4}';var $2='no';var $3='no';var $4='no';var $5='no';var $6='nosort';if($p0){$1=PPSMA.ReportsCommon.getCellTypeId($p0);}else{if($p1.get_results().get_sortColIndex()===1){$6=$p1.get_results().get_sortTypeRow();}}if(($1==='D')||($1==='P')||($1==='R')){if($p1.get_results().get_valueFilterRow()===1){$2='value';}if($p1.get_results().get_topFilterRow()===1){$2='top';}}else{$2='disable';$3='disable';}if(($1==='D')||($1==='P')||($1==='R')){if(($p1.get_results().get_filterEmptyAxis()&2)>0){$4='yes';}}else{$4='disable';}if($1==='D'||$1==='C'){if(($p1.get_results().get_filterEmptyAxis()&1)>0){$5='yes';}}else{$5='disable';}if($p0&&(PPSMA.ReportsCommon.getSortedCellColumnPosition($p0)===$p1.get_results().get_sortColIndex())){$6=$p1.get_results().get_sortTypeRow();}if($1==='P'||$1==='R'){$6='disablesort';}$0=String.format($0,$2,$3,$4,$5,$6);}else{$0='disable';}$p1.setOuterTagAttribute('arFilterState',$0);}},selectLinkCell:function(currCell){if(currCell){this.$1C(currCell.parentNode);if(currCell.innerHTML!==''&&PPSMA.DomElementEx.tagsMatch(currCell.firstChild.tagName,'a')){currCell.firstChild.focus();}}},$1E:function($p0){if($p0){$p0.focus();this.$1C($p0);}},selectOlapReportAndFocus:function(){if(this.get_$16()){return;}var $0=$get(this.$3.get_ctrlProxyId()+'_ag');if($0){$0.focus();}},handleSingleClick:function(e){var $0=PPSMA.EventsEx.getCurrentElement(e);var $1=$0.parentNode;var $2=this.$3.get_ctrlProxyId();var $3=$get($2+'_srlink');if(PPSMA.ReportsCommon.isInMoreAccessibleMode()){if($0.tagName!=='IMG'){if($0.tagName==='A'){this.$1C($1);$0.focus();}else{this.$1C($0);if($0.firstChild){$0.firstChild.focus();}}}}else{this.$1C($0);}},selectLink:function(e){var $0=PPSMA.EventsEx.getEvent(e);var $1=($0.button===2);var $2=($0.button!==2);if($2||$1){var $3=PPSMA.EventsEx.getCurrentElement($0);this.selectLinkCell($3);this.$5=(PPSMA.DomElementEx.tagsMatch($3.tagName,'a')&&$1);}},handleContextMenu:function(e){Array.clear(this.$4);var $0=PPSMA.EventsEx.getEvent(e);var $1=PPSMA.EventsEx.getCurrentElement(e);var $2=PPSMA.OlapGrid.$39($1);this.$1C($2);var $3=$get(this.$3.get_innerTargetId());var $4=PPSMA.SizeEx.getOffset($0,$1,$3);PPSMA.ContextMenu.create($2,this,$4[0],$4[1],this.$5);},hideViewInfoBarCtxMenu:function(e){var $0=PPSMA.EventsEx.getEvent(e);if($0.button===2){this.$6=true;Array.clear(this.$4);var $1=PPSMA.EventsEx.getCurrentElement(e);this.$7=PPSMA.OlapViewContext.getViewInfoDiv($1);var $2;var $3;if(isNullOrUndefined($0.offsetX)){$2=PPSMA.SizeEx.getXOffset($0,$1);$3=PPSMA.SizeEx.getYOffset($0,$1);}else{$2=$0.offsetX;$3=$0.offsetY;}PPSMA.ContextMenu.create($1,this,$2,$3,false);}},handleKeyEvent:function(e){var $0=true;var $1=PPSMA.EventsEx.getEvent(e);var $2=this.$3.get_ctrlProxyId();var $3=PPSMA.EventsEx.getCurrentElement(e);var $4=$get($2+'_srlink');if($3.id.startsWith('excoARR')||$3.id.startsWith('excoACR')){return $0;}if(PPSMA.DomElementEx.tagsMatch($3.tagName,'a')){if($4){if($3.id!==$4.id){$3=$3.parentNode;}}else{$3=$3.parentNode;}}var $5=$3;var $6=$5.cellIndex;var $7=$1.keyCode;var $8=37;var $9=39;var $A=38;var $B=40;var $C=32;var $D=13;var $E=1;var $F;var $10=this.$3.get_results().get_rowHierarchies();$F=$10.length;var $11=0;if(this.$8===1){if(!$F){$11=1;}else{$11=2;}}if(!this.$8){$11=$E+$F;}var $12=this._showProperties.getTotalMemberPropertyCount();var $13=$11+$12;switch($7){case $8:if($5.previousSibling){$5=$5.previousSibling;$5.focus();this.$1C($5);if($5.innerHTML!==''){if(PPSMA.DomElementEx.tagsMatch($5.firstChild.tagName,'a')){$5.firstChild.focus();}}}$0=false;break;case $A:if($5.parentNode.previousSibling){var $15=PPSMA.ReportsCommon.getCellColumnPosition($5);var $16=PPSMA.ReportsCommon.getCellTypeId(this.$1);if(($16==='C')||($16==='D')){if($15>0&&$6>0){$15=$15-$5.colSpan+$13;$15=PPSMA.OlapGrid.$17($5.parentNode.previousSibling,$15);}else{$15=$6;}}else{$15=$6;}$5=$5.parentNode.previousSibling.childNodes[$15];$5.focus();this.$1C($5);if($5.innerHTML!==''){if(PPSMA.DomElementEx.tagsMatch($5.firstChild.tagName,'a')){$5.firstChild.focus();}}}$0=false;break;case $9:if($5.nextSibling){$5=$5.nextSibling;$5.focus();this.$1C($5);}$0=false;break;case $B:if($5.parentNode.nextSibling){var $17=PPSMA.ReportsCommon.getCellColumnPosition($5);var $18=PPSMA.ReportsCommon.getCellTypeId(this.$1);if(($18==='C')||($18==='D')){if($17>0&&$6>0){$17=$17-$5.colSpan+$13;$17=PPSMA.OlapGrid.$17($5.parentNode.nextSibling,$17);}else{$17=$6;}}else{$17=$6;}$5=$5.parentNode.nextSibling.childNodes[$17];$5.focus();this.$1C($5);}$0=false;break;case $D:if($4){if($3.id===$4.id){this.handleSkipReport(e);}else{this.handleContextMenu(e);}}else{$0=false;}break;case $C:var $14=this.$18(this.$1);if($14){if($14.get_drilledDown()){this.$2E(this.$1);}else{this.$2D(this.$1);}}break;}return $0;},handleTabEvent:function(e){var $0=PPSMA.EventsEx.getCurrentElement(e);var $1=$0.parentNode;this.$1C($1);},handleDeselectCell:function(e){var $0=PPSMA.EventsEx.getCurrentElement(e);if(PPSMA.DomElementEx.tagsMatch($0.tagName,'a')){$0=$0.parentNode;}$0.style.backgroundColor=this.$2;},handleDoubleClick:function(e){window.document.onselectstart = eval('new Function(\'return false;\')');document.selection.empty();var $0=PPSMA.EventsEx.getCurrentElement(e);this.$2A($0);},handleExpandClick:function(e){var $0=PPSMA.EventsEx.getCurrentElement(e);var $1=null;if($0){if(PPSMA.DomElementEx.tagsMatch($0.tagName,'img')&&$0.className.toLowerCase().startsWith('excoImg'.toLowerCase())){$1=$0.parentNode.parentNode;}else if(PPSMA.DomElementEx.tagsMatch($0.tagName,'a')&&$0.className.toLowerCase().startsWith('excoA'.toLowerCase())){$1=$0.parentNode;}if($1){this.$2D($1);}var $2=new Sys.UI.DomEvent(e);$2.preventDefault();$2.stopPropagation();}},handleCollapseClick:function(e){var $0=PPSMA.EventsEx.getCurrentElement(e);var $1=null;if($0){if(PPSMA.DomElementEx.tagsMatch($0.tagName,'img')&&$0.className.toLowerCase().startsWith('excoImg'.toLowerCase())){$1=$0.parentNode.parentNode;}else if(PPSMA.DomElementEx.tagsMatch($0.tagName,'a')&&$0.className.toLowerCase().startsWith('excoA'.toLowerCase())){$1=$0.parentNode;}if($1){this.$2E($1);}var $2=new Sys.UI.DomEvent(e);$2.preventDefault();$2.stopPropagation();}},doShowContextMenu:function(){this.handleContextMenu(this.$11);},handleTouchStart:function(e){this.handleSingleClick(e);if (e.touches.length == 1){;this.$11=e;this.$10=window.setTimeout(Function.createDelegate(this,this.doShowContextMenu),1500);if(e.touches != undefined && e.touches[0] != undefined){ this._screenTouchPositionX = e.touches[0].screenX; this._screenTouchPositionY = e.touches[0].screenY; };}else{;window.clearTimeout(this.$10);};},handleTouchMove:function(e){if(e.targetTouches != undefined && e.targetTouches[0] != undefined){if (Math.abs(e.targetTouches[0].screenX - this._screenTouchPositionX) >= PPSMA.OlapGrid._contextCancelDeltaX || Math.abs(e.targetTouches[0].screenY - this._screenTouchPositionY) >= PPSMA.OlapGrid._contextCancelDeltaX){window.clearTimeout(this.lastTimeout);}};},handleTouchEnd:function(e){window.clearTimeout(this.$10);},handleTouchCancel:function(e){window.clearTimeout(this.$10);},addPrimaryMenuItems:function(m){var $0=this.$18(this.$1);var $1=PPSMA.ReportsCommon.getHeaderCellHierarchy(this.$3,this.$1);var $2=new PPSMA.MenuOptionHelper($0,$1,this.get_$15(),this.$3);if(this.$6){$2.showHideInfo(m,this.$0+'.handleShowHideInfoByDiv();',false);this.$6=false;return ($2.get_optionsAdded()>0);}var $3=PPSMA.ReportsCommon.getCellTypeId(this.$1);if(($3==='R')||($3==='C')||($3==='P')){if(($3==='R')||($3==='C')){if($0){$2.drillDown(m,this.$0+'.handleDrillDownMenuClick();',false);var $4=$2.drillDownTo(m,this.$0+'.fetchCallback('+this.$4.length+')',this.$0+'.populateCallback('+this.$4.length+')',this.$0+'.hoverOffCallback('+this.$4.length+')',false);if($4){var $5=new PPSMA.SubMenu($4,0);Array.add(this.$4,$5);}$2.drillUp(m,this.$0+'.handleDrillUpMenuClick();',false);if((this.$8===1)||($3==='C')){$2.expandCollapse(m,this.$0+'.handleExpandMenuClick();',this.$0+'.handleCollapseMenuClick();',false);}$2.showOnly(m,this.$0+'.handleShowOnlyMenuClick();',false);$2.remove(m,this.$0+'.handleRemoveMenuClick();',false);}}if(this.get_$15()){if(($3==='R')&&($0)){$2.showChangeMeasure(m,this.$0+'.handleShowChangeMeasureMenuClick();',this.get_$16(),false);PPSMA.ContextMenu.addMenuSeparator(m);$2.showProperties(m,this.$0+'.handleShowPropertiesMenuClick();',false,this._showProperties.isEnabled(this.$1));PPSMA.ContextMenu.addMenuSeparator(m);}if($3==='P'){$2.showChangeMeasure(m,this.$0+'.handleShowChangeMeasureMenuClick();',this.get_$16(),false);$2.showProperties(m,this.$0+'.handleShowPropertiesMenuClick();',false,this._showProperties.isEnabled(this.$1));PPSMA.ContextMenu.addMenuSeparator(m);}if($3==='C'){$2.showChangeMeasure(m,this.$0+'.handleShowChangeMeasureMenuClick();',this.get_$16(),false);PPSMA.ContextMenu.addMenuSeparator(m);this.$21(m);}if($3==='P'||$3==='R'||$3==='C'){this.$1F(m,$3);}$2.pivot(m,this.$0+'.handlePivotMenuClick();',false);}}else if($3==='D'){if(!this.get_$16()){var $6=true;if(this.$1.innerHTML===''){$6=false;}$2.decompositionTree(m,this.$0+'.handleAnalyzeInDecompMenuClick(\'\');',false,$6,this.get_$16());var $7=$2.hasAggregatedBackGroundHierarchies();if($7){$6=false;}$2.showDetails(m,this.$0+'.handleShowDetailsMenuClick(\'\');',false,$6);var $8=true;var $9=this.$1.getAttribute('rt');if(($9)&&($9==='aggr')){$8=false;}if($7){$8=false;}if($8){this.$3.set_cellActionData(null);}var $A=$2.additionalActions(m,this.$0+'.fetchCallback('+this.$4.length+')',this.$0+'.populateCallback('+this.$4.length+')',this.$0+'.hoverOffCallback('+this.$4.length+')',false,$8);if($A){var $B=new PPSMA.SubMenu($A,1);Array.add(this.$4,$B);}}if(this.get_$15()){PPSMA.ContextMenu.addMenuSeparator(m);$2.showChangeMeasure(m,this.$0+'.handleShowChangeMeasureMenuClick();',this.get_$16(),false);PPSMA.ContextMenu.addMenuSeparator(m);this.$21(m);this.$1F(m,$3);$2.pivot(m,this.$0+'.handlePivotMenuClick();',false);}}else if((($3==='Z')||($3==='Y'))&&this.get_$15()){var $C=this._showProperties.isEnabled(this.$1);$2.showProperties(m,this.$0+'.handleShowPropertiesMenuClick();',false,$C);this.$20(m,$2);PPSMA.ContextMenu.addMenuSeparator(m);$2.pivot(m,this.$0+'.handlePivotMenuClick();',false);}if(this.get_$15()){this.$22(m,$2);}$2.showHideInfo(m,this.$0+'.handleShowHideInfoMenuClick();',false);return ($2.get_optionsAdded()>0);},$1F:function($p0,$p1){var $0=this.$3.get_results().get_filterEmptyAxis();if(this.$3.get_results().get_filterEmptyAxis()===-1){return;}var $1=($0&2)>0;var $2=($0&1)>0;var $3=PPSMA.ContextMenu.addSubMenu($p0,PPSMA.SR.OlapContextMenu_Filter,this.$3.get_resourcePath()+'ImageFilter.gif',false);if(($p1==='D')||($p1==='P')||($p1==='R')){var $4=(this.$3.get_results().get_valueFilterRow()===1);var $5=(this.$3.get_results().get_topFilterRow()===1);if($4||$5){PPSMA.ContextMenu.addMenuOption($3,PPSMA.SR.OlapContextMenu_ClearFilter,this.$0+'.handleClearFilterMenuClick();',this.$3.get_resourcePath()+'ClearFilter.gif','',false,false);}else{PPSMA.ContextMenu.addDisabledMenuOption($3,PPSMA.SR.OlapContextMenu_ClearFilter,null,this.$3.get_resourcePath()+'ClearFilterD.gif',false);}if(!isNullUndefinedOrEmpty(this.$3.get_results().get_rowMembers())&&this.$3.get_results().get_rowMembers().length>0){PPSMA.ContextMenu.addMenuOption($3,PPSMA.SR.OlapContextMenu_ValueFilter,this.$0+'.handleValueFilterMenuClick();',($4)?this.$3.get_resourcePath()+'Check.gif':'','',false,false);PPSMA.ContextMenu.addMenuOption($3,PPSMA.SR.OlapContextMenu_TopFilter,this.$0+'.handleTopFilterMenuClick();',($5)?this.$3.get_resourcePath()+'Check.gif':'','',false,false);}PPSMA.ContextMenu.addMenuSeparator($3);}if(($p1==='D')||($p1==='P')||($p1==='R')){PPSMA.ContextMenu.addToggleMenuOption($3,PPSMA.SR.OlapContextMenu_EmptyRows,this.$0+'.handleFilterEmptyRowMenuClick();',this.$3.get_resourcePath()+'FilterEmpRow.gif','',$1,false);}if($p1==='D'||$p1==='C'){PPSMA.ContextMenu.addToggleMenuOption($3,PPSMA.SR.OlapContextMenu_EmptyCols,this.$0+'.handleFilterEmptyColMenuClick();',this.$3.get_resourcePath()+'FilterEmpCol.gif','',$2,false);}},$20:function($p0,$p1){var $0=PPSMA.ReportsCommon.getCellRowPosition(this.$1);var $1=PPSMA.ReportsCommon.getCellColumnPosition(this.$1);var $2=this.$3.get_results().get_rowHierarchies();var $3=$2[$0];var $4=$3.get_memberProperties();var $5=$4.get_captions();var $6=$4.get_names();var $7=$5[$1];if($7.length>20){$7=$7.substring(0,20)+PPSMA.SR.OlapPropertiesDialog_LongStringPadding;}$p1.hideProperty($p0,String.format(PPSMA.SR.OlapContextMenu_HideProperty,$7),this.$0+'._showProperties.handleHidePropertyMenuClick(\"'+$3.get_name()+'\", \"'+$6[$1]+'\");',false);},$21:function($p0){var $0=(PPSMA.ReportsCommon.getSortedCellColumnPosition(this.$1)===this.$3.get_results().get_sortColIndex());var $1=PPSMA.ContextMenu.addSubMenu($p0,PPSMA.SR.OlapContextMenu_Sort,this.$3.get_resourcePath()+'Sort.gif',false);PPSMA.ContextMenu.addMenuOption($1,PPSMA.SR.OlapContextMenu_LargeToSmall,this.$0+'.handleSortMenuClick(\'desc\');',this.$3.get_resourcePath()+'SortAscNum.gif',null,$0&&(this.$3.get_results().get_sortTypeRow()==='desc'),false);PPSMA.ContextMenu.addMenuOption($1,PPSMA.SR.OlapContextMenu_SmallToLarge,this.$0+'.handleSortMenuClick(\'asc\');',this.$3.get_resourcePath()+'SortDescNum.gif',null,$0&&(this.$3.get_results().get_sortTypeRow()==='asc'),false);PPSMA.ContextMenu.addMenuOption($1,PPSMA.SR.OlapContextMenu_NoSort,this.$0+'.handleSortMenuClick(\'nosort\');',null,null,true,false);},$22:function($p0,$p1){PPSMA.ContextMenu.addMenuSeparator($p0);$p1.reportTypeSubMenu($p0,this.$0,0);this.$23($p0,$p1);},$23:function($p0,$p1){var $0=$p1.formatReportSubMenu($p0,false);PPSMA.ContextMenu.addMenuOption($0,PPSMA.SR.OlapContextMenu_CompactLayout,this.$0+'.handleFormatReportMenuClick(1);',this.$3.get_resourcePath()+'LayoutCompact.gif',null,this.$8===1,false);PPSMA.ContextMenu.addMenuOption($0,PPSMA.SR.OlapContextMenu_TabularLayout,this.$0+'.handleFormatReportMenuClick(0);',this.$3.get_resourcePath()+'LayoutTabular.gif',null,!this.$8,false);},fetchCallback:function(smIndex){var $0=this.$4[smIndex];if($0){$0.set_hoverOn(true);switch($0.get_menuType()){case 1:if(!this.$3.get_cellActionData()&&!this.$24){this.$24=true;var $1=PPSMA.ReportsCommon.getCellRowPosition(this.$1);var $2=PPSMA.ReportsCommon.getCellColumnPosition(this.$1);var $3=new PPSMA.DetailsHelper(this.$3,this.$0,$1,$2,'');var $4=$3.getCellTupleXml();this.$3.getCellLevelActions($4);}break;case 0:if(!this.$3.get_cubeMetadata()){this.$3.loadCubeMetadata(this.$3.get_ctrlProxyId());}break;default:$0.set_hoverOn(false);break;}}},$24:false,populateCallback:function(smIndex){var $0=this.$4[smIndex];if($0&&$0.get_hoverOn()){var $1=$0.get_menu();var $2=$0.get_isPopulated();if(!$2){PPSMA.ContextMenu.removeAllButFirst($1);switch($0.get_menuType()){case 1:if(this.$3.get_cellActionData()){this.$25($1);$0.set_isPopulated(true);this.$24=false;}break;case 0:if(this.$3.get_cubeMetadata()){this.$26($1);$0.set_isPopulated(true);}break;default:break;}}if($2){PPSMA.ContextMenu.refreshMenu($1,false);}else if($0.get_isPopulated()){PPSMA.ContextMenu.refreshMenu($1,true);}}},hoverOffCallback:function(smIndex){var $0=this.$4[smIndex];if($0){$0.set_hoverOn(false);}},$25:function($p0){var $0=PPSMA.XmlEx.loadXml(this.$3.get_cellActionData());var $1=0;var $2=$0.getElementsByTagName('UrlAction');if(($2)&&($2.length>0)){for(var $4=0;$4<$2.length;$4++){PPSMA.ContextMenu.addMenuOption($p0,$2[$4].getAttribute('caption'),this.$0+'.handleShowUrlMenuClick(\''+$2[$4].getAttribute('content')+'\');',null,null,false,false);++$1;}}var $3=$0.getElementsByTagName('DDAction');if(($3)&&($3.length>0)){for(var $5=0;$5<$3.length;$5++){PPSMA.ContextMenu.addMenuOption($p0,$3[$5].getAttribute('caption'),this.$0+'.handleShowDetailsMenuClick(\''+$3[$5].getAttribute('resulttableindex')+'\');',null,null,false,false);++$1;}}if(!$1){var $6=$0.getElementsByTagName('AdditionalActions');if($6){PPSMA.ContextMenu.addDisabledMenuOption($p0,$6[0].getAttribute('message'),null,null,false);}}},$26:function($p0){var $0=PPSMA.ReportsCommon.getCellTypeId(this.$1);var $1=this.$18(this.$1);var $2=PPSMA.ReportsCommon.getHeaderCellHierarchy(this.$3,this.$1);if(($1)&&($2)){var $3=new PPSMA.DrillDownToHelper($1,$2,$0,this.$3);$3.populateSubMenuItems($p0,this.$0+'.handleDrillDownToMenuClick');}},$27:function($p0){var $0=PPSMA.SizeEx.getAbsoluteTop(this.$1);var $1=PPSMA.SizeEx.getAbsoluteLeft(this.$1);var $2=this.$1.offsetWidth;var $3=this.$1.offsetHeight;var $4=PPSMA.SizeEx.getClientHeight();if(($0+$p0)>$4){$0-=$p0;if($0<0){$0=0;}}var $5=PPSMA.SizeEx.getClientWidth();if(($1+225)>$5){$1=($5-225);if($1<0){$1=0;}}var $6=0;var $7=0;var $8=$get(this.$3.get_innerTargetId());if($8){$6=$8.scrollLeft;$7=$8.scrollTop;}var $9=new Sys.UI.Point($1+$2-$6-10,$0+$3-$7-10);return $9;},handleDrillDownMenuClick:function(){this.$2A(this.$1);},handleDrillDownToMenuClick:function(drillToHierarchyName,drillToMemberName,drillToLevelName){this.$2B(this.$1,unescape(drillToHierarchyName),unescape(drillToMemberName),unescape(drillToLevelName));},handleDrillUpMenuClick:function(){this.$2C(this.$1);},handleExpandMenuClick:function(){this.$2D(this.$1);},handleCollapseMenuClick:function(){this.$2E(this.$1);},handleShowOnlyMenuClick:function(){this.$2F(this.$1);},handleRemoveMenuClick:function(){this.$30(this.$1);},handleShowPropertiesMenuClick:function(){this.$3.set_dimensionData(null);this._showProperties.setCallbackMethod(Function.createDelegate(this,this.handleOlapGridCallback));this._showProperties.show(this.$1);},handleOlapGridCallback:function(){if(this._showProperties.get_selectedButton()==='2'||this._changeMeasure.get_selectedButton()==='2'){this.$1E(this.$1);}},handlePivotMenuClick:function(){this.$31();},handleFilterEmptyRowMenuClick:function(){this.$32();},handleSortMenuClickAsc:function(colIndex,rowIndex){this.$34('asc',colIndex,rowIndex);},handleClearFilterMenuClick:function(){this.$3.clearFilter('2',false);},handleValueFilterMenuClick:function(){var $0=null;if(this.$3&&this.$3.get_results()){$0=this.$3.get_results().get_valueFilterParamsRow();}var $1=null;this._valueFilter.set_selectedButton('2');if($0&&$0!==''){$1=$0.split(';');}var $2=0;if($1&&$1[0]!=='0'){$2=parseInt($1[0]);}this.$29('disablefilter',true);this._valueFilter.setCallbackMethod(Function.createDelegate(this,this.processFilterDialogResult));if($2>6&&$1){this._valueFilter.set_filterType($2);this._valueFilter.set_hierarchyName($1[1]);var $3=$1[2];this._valueFilter.set_value1($1[3]);this._valueFilter.set_value2($1[4]);this._valueFilter.set_levelName($1[5]);this._valueFilter.loadFilterDialog($1[0],$3,$1[5],this._valueFilter.get_hierarchyName(),this._valueFilter.get_value1(),this._valueFilter.get_value2(),this.$1,'2');}else{this._valueFilter.set_filterType(9);this._valueFilter.set_showClearOption(false);this._valueFilter.set_tupleIndex(0);if(this.$1){var $4=PPSMA.ReportsCommon.getCellTypeId(this.$1);if($4!=='R'){this._valueFilter.set_tupleIndex(PPSMA.ReportsCommon.getCellColumnPosition(this.$1));}}this._valueFilter.set_value1('0');this._valueFilter.set_value2('100');this._valueFilter.set_currentCell(this.$1);this._valueFilter.set_axis('2');this._valueFilter.set_innerTargetID((this.$3)?this.$3.get_innerTargetId():null);this._valueFilter.showValueFilterDlg();}},processFilterDialogResult:function(){this.$28('disablefilter');if(this._valueFilter.get_selectedButton()==='1'){this.$3.filter(this._valueFilter.get_filterType().toString(),this._valueFilter.get_hierarchyName(),this._valueFilter.get_tupleXML(),this._valueFilter.get_axis(),this._valueFilter.get_levelName(),this._valueFilter.get_value1(),this._valueFilter.get_value2());}else if(this._valueFilter.get_selectedButton()==='2'){this.$1E(this.$1);}else if(this._valueFilter.get_selectedButton()==='3'){this.$3.clearFilter(this._valueFilter.get_axis(),(this._valueFilter.get_axis()==='2'));}},$28:function($p0){var $0='';$0=this.$3.getOuterTagAttribute('arFilterState');$0=$0.replace(';'+$p0,'');this.$3.setOuterTagAttribute('arFilterState',$0);},$29:function($p0,$p1){var $0='';if($p1){$0=this.$3.getOuterTagAttribute('arFilterState');$0=$0+';'+$p0;}this.$3.setOuterTagAttribute('arFilterState',$0);},handleTopFilterMenuClick:function(){var $0=null;if(this.$3&&this.$3.get_results()){$0=this.$3.get_results().get_valueFilterParamsRow();}var $1=null;this._valueFilter.set_selectedButton('2');if($0&&$0!==''){$1=$0.split(';');}var $2=0;if($1&&$1[0]!=='0'){$2=parseInt($1[0]);}this.$29('disablefilter',true);this._valueFilter.setCallbackMethod(Function.createDelegate(this,this.processFilterDialogResult));if($2>0&&$2<7&&$1){this._valueFilter.set_filterType($2);this._valueFilter.set_hierarchyName($1[1]);var $3=$1[2];this._valueFilter.set_value1($1[3]);this._valueFilter.set_value2($1[4]);this._valueFilter.set_levelName($1[5]);this._valueFilter.loadFilterDialog($1[0],$3,$1[5],this._valueFilter.get_hierarchyName(),this._valueFilter.get_value1(),this._valueFilter.get_value2(),this.$1,'2');}else{this._valueFilter.set_filterType(1);this._valueFilter.set_showClearOption(false);this._valueFilter.set_tupleIndex(0);if(this.$1){this._valueFilter.set_tupleIndex(PPSMA.ReportsCommon.getSortedCellColumnPosition(this.$1));}this._valueFilter.set_value1('10');this._valueFilter.set_currentCell(this.$1);this._valueFilter.set_axis('2');this._valueFilter.set_innerTargetID((this.$3)?this.$3.get_innerTargetId():null);this._valueFilter.showTopFilterDlg();}},loadFilterDialog:function(sFilterTypeIndex,hierarchy,tuple,level,value1,value2,axis){this._valueFilter.setCallbackMethod(Function.createDelegate(this,this.processFilterDialogResult));this._valueFilter.loadFilterDialog(sFilterTypeIndex,tuple,level,hierarchy,value1,value2,this.$1,axis);},handleSortMenuClickDesc:function(colIndex,rowIndex){this.$34('desc',colIndex,rowIndex);},handleSortMenuClick:function(sortType){this.$35(this.$1,sortType);},handleFilterEmptyColMenuClick:function(){this.$33();},handleFormatReportMenuClick:function(reportLayout){this.$37(reportLayout);},handleShowHideInfoByDiv:function(){this.$3.toggleViewInfoBar(this.$7.firstChild);},handleShowHideInfoMenuClick:function(){var $0=null;var $1=this.$1.parentNode;while($1){if(PPSMA.DomElementEx.tagsMatch($1.tagName,'table')){$0=$1;break;}$1=$1.parentNode;}var $2=null;if($0){var $3=$0.parentNode.parentNode;$1=$3.firstChild;while($1){if(PPSMA.DomElementEx.tagsMatch($1.tagName,'div')&&($1.id==='_viewInfoId')){$2=$1;break;}$1=$1.nextSibling;}}if($2){this.$3.toggleViewInfoBar($2.firstChild);}},handleMeasureGroupNameChange:function(){var $0='window.event.srcElement.id';var $1=eval($0);var $2=$get($1);if($2){var $3=$2.getAttribute('MeasureGroupName');this.$3.get_measures().set_measureGroupName($3);}},handleShowChangeMeasureMenuClick:function(){this._changeMeasure.setCallbackMethod(Function.createDelegate(this,this.handleOlapGridCallback));this._changeMeasure.show(this.$1);},handleShowUrlMenuClick:function(urlContent){var $0=window.self.screen;var $1=parseInt(($0.availWidth-800)/2);var $2=parseInt(($0.availHeight-400)/2);var $3=window.open(urlContent,'URLWindow','left='+$1+',top='+$2+',height=400'+',width=800'+',menubar,toolbar,titlebar,status,location,resizable,scrollbars');if($3){$3.focus();}},handleAnalyzeInDecompMenuClick:function(misc){var $0=PPSMA.ReportsCommon.getCellRowPosition(this.$1);var $1=PPSMA.ReportsCommon.getCellColumnPosition(this.$1);var $2=new PPSMA.AnalyzeInDecompHelper();$2.launchAnalyzeRequest(this.$3,this.$0,$0,$1);},handleShowDetailsMenuClick:function(resultTableIndex){this.$38(this.$1,resultTableIndex);},$2A:function($p0){if(this.get_$15()){var $0=this.$18($p0);var $1=PPSMA.ReportsCommon.getHeaderCellHierarchy(this.$3,$p0);if(($0)&&($1)){if($0.get_hasChildren()){this.$3.drillDown($1.get_name(),$0.get_name());}}}},$2B:function($p0,$p1,$p2,$p3){if(this.get_$15()){var $0=this.$18($p0);var $1=PPSMA.ReportsCommon.getHeaderCellHierarchy(this.$3,$p0);if(($0)&&($1)){this.$3.crossDrill($1.get_name(),$0.get_name(),$p1,$p2,$p3);}}},$2C:function($p0){if(this.get_$15()){var $0=this.$18($p0);var $1=PPSMA.ReportsCommon.getHeaderCellHierarchy(this.$3,$p0);if(($0)&&($1)){if($0.get_hasParent()){this.$3.drillUp($1.get_name(),$0.get_name());}}}},$2D:function($p0){if(this.get_$15()){var $0=this.$18($p0);var $1=PPSMA.ReportsCommon.getHeaderCellHierarchy(this.$3,$p0);if(($0)&&($1)){if($0.get_hasChildren()){this.$3.expand($1.get_name(),$0.get_name());}}}},$2E:function($p0){if(this.get_$15()){var $0=this.$18($p0);var $1=PPSMA.ReportsCommon.getHeaderCellHierarchy(this.$3,$p0);if(($0)&&($1)){if($0.get_drilledDown()){this.$3.collapse($1.get_name(),$0.get_name());}}}},$2F:function($p0){if(this.get_$15()){var $0=this.$18($p0);var $1=PPSMA.ReportsCommon.getHeaderCellHierarchy(this.$3,$p0);if(($0)&&($1)){if(!$1.get_isSingleton()){this.$3.showOnly($1.get_name(),$0.get_name());}}}},$30:function($p0){if(this.get_$15()){var $0=this.$18($p0);var $1=PPSMA.ReportsCommon.getHeaderCellHierarchy(this.$3,$p0);if(($0)&&($1)){if(!$1.get_isSingleton()){this.$3.hide($1.get_name(),$0.get_name());}}}},$31:function(){if(this.get_$15()){this.$3.pivot();}},$32:function(){if(this.get_$15()){var $0=(this.$3.get_results().get_filterEmptyAxis()&2)>0;this.$3.filterEmpty('2',!$0);}},$33:function(){if(this.get_$15()){var $0=(this.$3.get_results().get_filterEmptyAxis()&1)>0;this.$3.filterEmpty('1',!$0);}},$34:function($p0,$p1,$p2){if(this.get_$15()){var $0=new PPSMA.DetailsHelper(this.$3,this.$0,$p2,$p1,'');var $1=$0.getCellTupleXml();if($1){this.$36($p0,$1);}}},$35:function($p0,$p1){if(this.get_$15()&&this.$3){var $0=0;var $1=0;if($p0){$1=PPSMA.ReportsCommon.getSortedCellColumnPosition($p0);}var $2=new PPSMA.DetailsHelper(this.$3,this.$0,$0,$1,'');var $3=$2.getCellTupleXml();if($3){this.$36($p1,$3);}}},$36:function($p0,$p1){if(this.get_$15()){var $0='false';if(this.$8===1){$0='true';}this.$3.sort('2',$p1,$p0,$0);}},$37:function($p0){this.$3.changeViewConfiguration('ReportLayout',($p0).toString());},switchToGrid:function(){},switchToColumnChart:function(){this.$3.switchOlapReportType(1,null);},switchToColumnChartStacked:function(){this.$3.switchOlapReportType(2,null);},switchToColumnChartStacked100:function(){this.$3.switchOlapReportType(3,null);},switchToLineChart:function(){this.$3.switchOlapReportType(4,null);},switchToLineChartWithMarkers:function(){this.$3.switchOlapReportType(5,null);},switchToPieChart:function(){this.$3.switchOlapReportType(6,null);},$38:function($p0,$p1){var $0=PPSMA.ReportsCommon.getCellRowPosition($p0);var $1=PPSMA.ReportsCommon.getCellColumnPosition($p0);var $2=new PPSMA.DetailsHelper(this.$3,this.$0,$0,$1,$p1);$2.showDetails();},addDatasourceFormattingStyle:function(sheetName,cssRuleName,cssRuleDef){var $0=PPSMA.OlapGrid.$3B(sheetName);if(!$0){return;}PPSMA.OlapGrid.$3C($0,'.'+cssRuleName,cssRuleDef);},replaceGridStyles:function(sheetName,fontSize,fontName,fontColor,gridBackgroundColor,headerBackgroundColor,fontStyle){if(!this.$9){var $0=PPSMA.OlapGrid.$3B(sheetName);if(!$0){return;}var $1=String.format('text-align: left; padding: 4px 5px 4px 5px; border: solid 1px #d0d8e5; white-space: nowrap; font-size:{0}pt !Important; font-family:{1} !Important; color:{2} !Important; background-color:{3}; {4}',fontSize,fontName,fontColor,gridBackgroundColor,fontStyle);var $2=String.format('text-align: right; padding: 4px 5px 4px 5px; border: solid 1px #d0d8e5; white-space: nowrap; font-size:{0}pt !Important; font-family:{1} !Important; color:{2} !Important; background-color:{3}; {4}',fontSize,fontName,fontColor,gridBackgroundColor,fontStyle);var $3=String.format('border: solid 1px #d0d8e5; font-weight: normal; text-align: left; padding: 4px 5px 4px 5px; white-space: nowrap; font-size:{0}pt !Important; font-family:{1} !Important; color:{2} !Important; background-color:{3}; {4}',fontSize,fontName,fontColor,headerBackgroundColor,fontStyle);var $4=String.format('border: solid 1px #d0d8e5 !Important; font-weight: normal; text-align: left; padding: 4px 5px 4px 5px; white-space: nowrap; font-size:{0}pt !Important; font-family:{1} !Important; color:{2} !Important; background-color:{3}; {4}',fontSize,fontName,fontColor,headerBackgroundColor,fontStyle);var $5=String.format('border: solid 1px #d0d8e5; text-align: left; padding: 4px 5px 4px 5px; white-space: nowrap; font-size:{0}pt !Important; font-family:{1} !Important; color:{2} !Important; background-color:{3}; {4}',fontSize,fontName,fontColor,headerBackgroundColor,fontStyle);var $6=String.format('text-decoration: none; cursor: default; color:{0} !Important; {1}',fontColor,fontStyle);var $7=String.format('border: solid 1px #d0d8e5; text-align: left; padding: 4px 5px 4px 5px; white-space: nowrap; font-size:{0}pt !Important; font-family:{1} !Important; color:{2} !Important; background-color:{3}; {4}',fontSize,fontName,fontColor,headerBackgroundColor,fontStyle);var $8=String.format('text-align: left; padding: 4px 5px 4px 5px; border: solid 1px #d0d8e5; white-space: nowrap; font-size:{0}pt !Important; font-family:{1} !Important; color:{2} !Important; background-color:{3}; {4}',fontSize,fontName,fontColor,gridBackgroundColor,fontStyle);var $9=String.format('text-decoration: none !Important; cursor:default; color:{0} !Important; {1}',fontColor,fontStyle);var $A=this.$3.get_ctrlProxyId();PPSMA.OlapGrid.$3C($0,'.'+$A+'_rh',$1);PPSMA.OlapGrid.$3C($0,'.'+$A+'_oc',$2);PPSMA.OlapGrid.$3C($0,'.'+$A+'_chsa',$3);PPSMA.OlapGrid.$3C($0,'.'+$A+'_ch',$4);PPSMA.OlapGrid.$3C($0,'.'+$A+'_ph',$5);PPSMA.OlapGrid.$3C($0,'.'+$A+'_phLink',$6);PPSMA.OlapGrid.$3C($0,'.'+$A+'_prh',$7);PPSMA.OlapGrid.$3C($0,'.'+$A+'_prv',$8);PPSMA.OlapGrid.$3C($0,'.'+$A+'_amLink',$9);}},handleLinksBeforeAndAfterSkipReportDivKeyup:function(e){var $0=e.srcElement;if($0){if($0.id&&$0.id===this.$3.get_ctrlProxyId()+'_bSkipReportId'){if(e.keyCode===9){if(e.shiftKey){this.hideSkipReport();}else{this.showSkipReport();}}}else if($0.id&&$0.id===this.$3.get_ctrlProxyId()+'_aSkipReportId'){if(e.keyCode===9){if(e.shiftKey){this.showSkipReport();}else{this.hideSkipReport();}}}}else{PPSMA.ReportsCommon.logErrorCondition('can\'t find what was focused');}},showSkipReport:function(){var $0=$get(this.$3.get_ctrlProxyId()+'_skipReportId');if($0){$0.style.display='block';$0.firstChild.focus();}else{PPSMA.ReportsCommon.logErrorCondition('couldn\'t find '+this.$3.get_ctrlProxyId()+'_skipReportId');}},hideSkipReport:function(){var $0=$get(this.$3.get_ctrlProxyId()+'_skipReportId');if($0){$0.style.display='none';}else{PPSMA.ReportsCommon.logErrorCondition('couldn\'t find '+this.$3.get_ctrlProxyId()+'_skipReportId');}},handleSkipReport:function(e){var $0=$get(this.$3.get_ctrlProxyId()+'_ag');var $1=null;if(!$0){PPSMA.ReportsCommon.logErrorCondition('can\'t find the grid, bailing');return;}else{try{$1=$0.lastChild.lastChild.lastChild.lastChild;}catch($2){$1=null;}}this.hideSkipReport();if($1&&PPSMA.DomElementEx.tagsMatch($1.tagName,'a')&&$1.className&&PPSMA.DomElementEx.tagsMatch($1.className,'amlink')){$1.focus();}else{PPSMA.ReportsCommon.logErrorCondition('can\'t find the last cell link in the grid, bailing');}},assignFocus:function(){var $0=this.$3.get_ctrlProxyId();var $1=$get($0+'_skipReportId');var $2=$get($0+'_srlink');var $3=$get('PrXcYLink').firstChild;var $4=$3.parentNode;if(PPSMA.ReportsCommon.isInMoreAccessibleMode()){$1.style.display='block';$2.focus();}else{this.$1C($4);$3.focus();}}}
PPSMA.OlapGrid.registerClass('PPSMA.OlapGrid',null,PPSMA.OlapView);PPSMA.OlapGrid.$12=40;PPSMA.OlapGrid.$13=40;
// ---- Do not remove this footer ----
// Generated using Script# v0.5.0.0 (http://projects.nikhilk.net)
// -----------------------------------

if(typeof(Sys)!=='undefined')Sys.Application.notifyScriptLoaded();