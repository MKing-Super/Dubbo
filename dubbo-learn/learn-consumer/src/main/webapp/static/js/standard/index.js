const index = {};

index.initButton = function (){

    
    $("#downloadTxt").click(function (text) {
        $.ajax({
            //请求方式
            type : "POST",
            //请求的媒体类型
            contentType: "application/json;charset=UTF-8",
            //请求地址
            url : "/zk/downloadTxt",
            //数据，json字符串
            data : "",
            //请求成功
            success : function(result) {
                alert(result)
            },
            //请求失败，包含具体的错误信息
            error : function(){
                alert("返回信息失败！！！")
            }
        });
        return "55";
    });

    $("#tt").click(function () {
        alert("6666");
    });
};

index.initOnload = function () {

};

$(function(){
    index.initButton();
    index.initOnload();
});