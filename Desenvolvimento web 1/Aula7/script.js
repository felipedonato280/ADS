$(document).ready(function(){

    $("#enviar").click(function(){
        nome = $("#nome").val();
        peso = $("#peso").val();
        altura = $("#altura").val();

        if(peso && altura > 0){
            imc = (peso / (altura ** 2)).toFixed(2);
            $("#dados").append(`<li>${nome} seu IMC é: ${imc}<input type="button" value="Remover" class= "remover"></li>`)
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