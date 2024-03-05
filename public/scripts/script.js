function stopScroll(id, scroll){
  let popup = document.getElementById(id);
  

  if(popup.classList.contains('open-popup')) {

    let service = document.getElementById('service');
    let navbar = document.getElementById('navbar');
    navbar.classList.add("add-blur");
    service.classList.add("add-blur");

    document.body.classList.add("stop-scrolling");

  }
}
