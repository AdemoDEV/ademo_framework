var money = 0
var dirty = 0
var bank = 0

$(function() {
    window.addEventListener("message", function(event) {
        var mess = event.data;
        $("#addmoney").fadeOut();
        if (typeof mess.firt !== 'undefined') {
            $('#money').html(mess.money + '$');
            $('#dirty').html(mess.dirty + '$');
            $('#bank').html(mess.bank + '$');
            $('#job').html(mess.job);
            $('#job2').html(mess.job2);
            money = mess.money
            dirty = mess.dirty
            bank = mess.bank
        }


        if (typeof mess.additem !== 'undefined' ) {
            
        }

        if (typeof mess.addmoney !== 'undefined') {
            if (mess.type == "money") {
               money = money + mess.count
               var styleClass = document.getElementById('addmoney');
               styleClass.style.color = 'rgb(27, 190, 12)'
               $("#addmoney").html("+ " + mess.count + "$")
               $("#money").html(money + '$')
               $("#addmoney").fadeIn("slow", function() {
                    setTimeout(function() {
                        $("#addmoney").fadeOut("slow", function() {});
                    }, 2000);
                });
            } else if (mess.type == "bank") {
                bank = bank + mess.count
                var styleClass = document.getElementById('addmoney');
                styleClass.style.color = 'rgb(9, 176, 226)'
                $("#addmoney").html("+ " + mess.count + "$")
                $("#bank").html(bank + '$')
                $("#addmoney").fadeIn("slow", function() {
                    setTimeout(function() {
                        $("#addmoney").fadeOut("slow", function() {});
                    }, 2000);
                });
            } else if (mess.type == "dirty") {
                dirty = dirty + mess.count
                var styleClass = document.getElementById('addmoney');
                styleClass.style.color = 'rgb(204, 19, 19)'
                $("#addmoney").html("+ " + mess.count + "$")
                $("#dirty").html(dirty + '$')
                $("#addmoney").fadeIn("slow", function() {
                    setTimeout(function() {
                        $("#addmoney").fadeOut("slow", function() {});
                    }, 2000);
                });
            }
        }


        // if (typeof mess.hud !== 'undefined') {
        //     if (mess.hud == true) {
        //         console.log(true)
        //     } else {
        //         console.log(false)
        //     }
        // }

    });
});