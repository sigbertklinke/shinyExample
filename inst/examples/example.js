shinyjs.init = function() {
  window.progressCounter=0; 
  window.progressTimer=null; 
  window.progressInterval=function() {
    window.progressCounter++; 
    document.getElementById("progress-text").innerHTML=window.progressCounter; 
  }
}
shinyjs.spinner = function(param){
  document.getElementById("progress-spinner").style.visibility=param; 
  window.progressCounter=0; 
  if (param=="visible") 
    window.progressTimer=setInterval(window.progressInterval, 1000);
  else clearInterval(window.progressTimer);
}