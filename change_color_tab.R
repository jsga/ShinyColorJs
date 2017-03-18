#' change_color_tab
#'
#' Description: changes the  color of the text of a tabPanel in a tabSetPanel
#'
#' Arguments
#' tabId: ID of the tabSetPanel
#' subTabNumber: number of the tab we want to change the color
#' color: string giving the color name, or in CEX
#' 
 
change_color_tab = function(tabId,subTabNumber,color){
  command_js = paste0("document.getElementById('",tabId,"').children[",subTabNumber-1,"].children[0].style.color = '",color,"'")
  runjs(command_js)
}