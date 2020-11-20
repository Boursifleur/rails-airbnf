
const changeMarkerOnHover = () => {
  const cards = document.querySelectorAll(".card-product");
  cards.forEach((card) => {
    card.addEventListener('mouseover', (event) => {
      const planeId = event.currentTarget.dataset.plane_id;
      const marker = document.querySelector("[data-plane-id-marker='" + parseInt(planeId) + "']");
      marker.style.height = "40px";
      marker.style.width = "40px";
    });
    card.addEventListener('mouseout', (event) => {
      const planeId = event.currentTarget.dataset.plane_id;
      const marker = document.querySelector("[data-plane-id-marker='" + parseInt(planeId) + "']");
      marker.style.height = "25px";
      marker.style.width = "25px";
    });
  });
};

export { changeMarkerOnHover };
