#' change_bgcolor_tab
#'
#' Description: changes the background color of a tabPanel in a tabSetPanel
#'
#' Arguments
#' tabId: ID of the tabSetPanel
#' subTabNumber: number of the tab we want to change the color
#' color: string giving the color name, or in CEX
#' 

change_bgcolor_tab = function(tabId,subTabNumber,color){
  command_js = paste0("document.getElementById('",tabId,"').children[",subTabNumber-1,"].children[0].style.background = '",color,"'")
  runjs(command_js)
}
