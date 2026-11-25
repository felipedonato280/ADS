$(document).ready(function(){
    $(".fieldset-cursos").hide();

    $("#curso").change(function(){
        /*escolha = $("#curso").val();*/
        escolha = $(this).val();

        switch(escolha){
            case "info":
                $(".fieldset-cursos").hide();
                $("#medio").show();
                break;
            case "tads":
                $(".fieldset-cursos").hide();
                $("#superior").show();
                break;
            default:
                $(".fieldset-cursos").hide();
        }

        /*
        if(escolha == "info"){
            $("#medio").show();
            $("#superior").hide();
        } else if(escolha == "tads"){
            $("#superior").show();
            $("#medio").hide();
        } else{
            $(".fieldset-cursos").hide();
        }
        */
    });
});