
exports.interogareClienti = function(req, res){

    if(req.method == "POST"){
        var post  = req.body;

        var value1= post.value1;
    }

    var hidden = "show";

    var userId = req.session.userId;
    if(userId == null){
        res.redirect("/login");
        return;
    }

    var sql2 = "CALL interogareClienti('" + value1 + "');";
    db.query(sql2, function(err, results){  
        if(err) {
            console.log(err);
        }
        else {

            const data = [];
            for(let i=0; i<results[0].length; i++){
                data[i] = [];
                data[i][0] = results[0][i].idclient;
                data[i][1] = results[0][i].nume;
                data[i][2] = results[0][i].statut;
                data[i][3] = results[0][i].adresa;
                data[i][4] = results[0][i].telefon;
            }

            res.render('clienti', {
                hidden: hidden,
                results: data
            });
            
        }
    });
 };

 
exports.interogareZboruri = function(req, res){

    if(req.method == "POST"){
        var post  = req.body;

        var value1= post.value1;
        var value2= post.value2;
    }

    var hidden = "show";

    var userId = req.session.userId;
    if(userId == null){
        res.redirect("/login");
        return;
    }

    var sql2 = "CALL interogareZboruri('" + value1 + "','" + value2 + "');";
    db.query(sql2, function(err, results){  
        if(err) {
            console.log(err);
        }
        else {

            const data = [];
            for(let i=0; i<results[0].length; i++){
                data[i] = [];
                data[i][0] = results[0][i].nrzbor;
                data[i][1] = results[0][i].plecare;
                data[i][2] = results[0][i].sosire;
                data[i][3] = results[0][i].de_la;
                data[i][4] = results[0][i].la;
                data[i][5] = results[0][i].aparat_zbor;
                data[i][6] = results[0][i].nr_locuri;
            }

            res.render('zboruri', {
                hidden: hidden,
                results: data
            });
            
        }
    });
 };

 
exports.interogareBilete= function(req, res){

    if(req.method == "POST"){
        var post  = req.body;

        var value1= post.value1;
        var value2= post.value2;
    }

    var hidden = "show";

    var userId = req.session.userId;

    if(userId == null){
        res.redirect("/login");
        return;
    }

    var sql2 = "CALL interogareBilete('" + value1 + "','" + value2 + "');";
    db.query(sql2, function(err, results){  
        if(err) {
            console.log(err);
        }
        else {

            const data = [];
            for(let i=0; i<results[0].length; i++){
                data[i] = [];
                data[i][0] = results[0][i].nrbilet;
                data[i][1] = results[0][i].clasa;
                data[i][2] = results[0][i].valoare;
                data[i][3] = results[0][i].sursa;
                data[i][4] = results[0][i].destinatie;
                data[i][5] = results[0][i].nume_client;
            }

            res.render('bilete', {
                hidden: hidden,
                results: data
            });
            
        }
    });
 };


 
exports.interogareCupoane= function(req, res){

    if(req.method == "POST"){
        var post  = req.body;

        var value1= post.value1;
        var value2= post.value2;
        var value3= post.value3;
    }

    var hidden = "show";

    var userId = req.session.userId;
    
    if(userId == null){
        res.redirect("/login");
        return;
    }

    var sql2 = "CALL interogareCupoane('" + value1 + "','" + value2 + "','" + value3 + "');";
    db.query(sql2, function(err, results){  
        if(err) {
            console.log(err);
        }
        else {

            const data = [];
            for(let i=0; i<results[0].length; i++){
                data[i] = [];
                data[i][0] = results[0][i].nrbilet;
                data[i][1] = results[0][i].nrzbor;
                data[i][2] = results[0][i].plecare;
                data[i][3] = results[0][i].clasa_efectiva;
                data[i][4] = results[0][i].loc;
            }

            res.render('cupoane', {
                hidden: hidden,
                results: data
            });
            
        }
    });
 };