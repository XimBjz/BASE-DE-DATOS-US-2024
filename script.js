
function cargarDatos() {
    fetch("diccionario_mixteca.json")
      .then((response) => response.json())
      .then((data) => {
        actualizarDatos(data);
      })
      .catch((error) => console.error("Error:", error));
  }
  
  function actualizarDatos(data) {
    const tabla = document.getElementById("tableBody");
    tabla.innerHTML = "";
    let contador = 0;
    data.forEach((element) => {
      let fila = tabla.insertRow();
      let celdaMixteco = fila.insertCell();
      let celdaEspanol = fila.insertCell();
  
      celdaMixteco.textContent = element.Mixteco;
      celdaEspanol.textContent = element.Español;
      contador++;
    });
    document.getElementById("contador").textContent = contador;
  }
  
  function filtrarPalabras() {
    const textoBusqueda = document.getElementById("buscar").value.toLowerCase();
    fetch("diccionario_mixteca.json")
      .then((response) => response.json())
      .then((data) => {
        const datosFiltrados = data.filter(
          (element) =>
            element.Mixteco.toLowerCase().includes(textoBusqueda) ||
            element.Español.toLowerCase().includes(textoBusqueda)
        );
        actualizarDatos(datosFiltrados);
        console.log(datosFiltrados);
      })
      .catch((error) => console.error("Error:", error));
  }
  
  window.onload = cargarDatos;