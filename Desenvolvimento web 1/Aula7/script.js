/*
document.addEventListener("DOMContentLoaded", function() {
   document.getElementById("enviar").addEventListener("click", function(){
        alert("Ola");
    });
});
*/

$(document).ready(function(){

    $("#enviar").click(function(){
        /*
        const InputPeso = document.getElementById("peso").value;
        const InputAltura = document.getElementById("altura").value;

        const peso = parseFloat(InputPeso);
        const altura = parseFloat(InputAltura);

        if(peso && altura > 0){
            const IMC = (peso / (altura ** 2)).toFixed(2);
            $("#dados").append(`<li>Seu IMC é: ${IMC}</li>`);
        } else{
            alert("Por favor, digite um valor valido");
        }
        */

        nome = $("#nome").val();
        peso = $("#peso").val();
        altura = $("#altura").val();

        if(peso && altura > 0){
            imc = (peso / (altura ** 2)).toFixed(2);
            $("#dados").append(`<li>${nome} seu IMC é: ${imc}`)
        }else{
            alert("Valores invalidos!");
        }
    });

    $("#apagar").click(function(){
        if(confirm("Deseja apagar a lista?")){
            $("#dados").empty()
        }
    });
});