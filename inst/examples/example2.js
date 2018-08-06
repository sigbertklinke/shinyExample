var inShinyExample = true;

window.progressCounter=0;
window.progressTimer=null;
window.progressInterval=function() {
  window.progressCounter++;
  document.getElementById("progress-text").innerHTML=window.progressCounter;
}

Shiny.addCustomMessageHandler("spinner",
  function(param) {
    console.log(param);
    document.getElementById("progress-spinner").style.visibility=param;
    window.progressCounter=0;
    if (param=="visible")
      window.progressTimer=setInterval(window.progressInterval, 1000);
    else clearInterval(window.progressTimer);
  }
);
