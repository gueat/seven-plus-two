$(function () {
    $('#alipay').click(function () {
        console.log('11')
        request_data = {
            'orderid': $(this).attr('data-orderid')
        }
        $.get('/pay/', request_data, function (response) {
            console.log(response)
            if (response.status == 1){
                location.href = response.alipayurl
            }
        })
    })
})