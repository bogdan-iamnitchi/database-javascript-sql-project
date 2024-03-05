
exports.interogare3A = function(req, res){

    if(req.method == "POST"){
        var post  = req.body;

        var value1= post.value1;
        var value2= post.value2;
    }

    var message = ""
    var blur = "add-blur"
    var openPopup = "open-popup"
    var icon = "fas fa-bars alig"
    var titlu = "Interogarea 3A"
    var cerinta = "Să se găsească clasa, sursa și destinația biletelor pentru idclient între "+ value1 +" și "+ value2 +" ordonat descrescător după valoare și crescător după sursa.";

    const tHead = ["Clasa", "Sursa", "Destinatie"];

    var userId = req.session.userId;
    if(userId == null){
        res.redirect("/login");
        return;
    }

    var sql1="SELECT * FROM users WHERE id = ?";
    db.query(sql1, [userId], function(err, results){
        message = results[0].name;
       });

    var sql2 = "CALL interogare3A(" + value1 + "," + value2 + ");";
    db.query(sql2, function(err, results){  
        if(err) {
            console.log(err);
        }
        else {

            const data = [];
            for(let i=0; i<results[0].length; i++){
                data[i] = [];
                data[i][0] = results[0][i].clasa;
                data[i][1] = results[0][i].sursa;
                data[i][2] = results[0][i].destinatie;
            }

            res.render('interogari', {
                message: message,
                blur: blur,
                openPopup: openPopup, 
                icon: icon,
                titlu: titlu,
                cerinta: cerinta,
                tHead: tHead,
                results: data
            });
            
        }
    });
 };


exports.interogare3B = function(req, res){

    if(req.method == "POST"){
        var post  = req.body;
        var value1= post.value1;
    }

    var message = ""
    var blur = "add-blur"
    var openPopup = "open-popup"
    var icon = "far fa-user alig"
    var titlu = "Interogarea 3B"
    var cerinta = "Să se găsească aparatele de zbor cu număr locuri sub " + value1 + " ordonat descrescător după nr_locuri.";

    const tHead = ["Aparat de Zbor", "Numarul de locuri"];

    var userId = req.session.userId;
    if(userId == null){
        res.redirect("/login");
        return;
    }

    var sql1="SELECT * FROM users WHERE id = ?";
    db.query(sql1, [userId], function(err, results){
        message = results[0].name;
       });

    var sql2 = "CALL interogare3B(" + value1 + ");";
    db.query(sql2, function(err, results){  
        if(err) {
            console.log(err);
        }
        else {

            const data = [];
            for(let i=0; i<results[0].length; i++){
                data[i] = [];
                data[i][0] = results[0][i].aparat_zbor;
                data[i][1] = results[0][i].nr_locuri;
            }

            res.render('interogari', {
                message: message,
                blur: blur,
                openPopup: openPopup, 
                icon: icon,
                titlu: titlu,
                cerinta: cerinta,
                tHead: tHead,
                results: data
            });
            
        }
    });
 };

 
exports.interogare4A = function(req, res){

    if(req.method == "POST"){
        var post  = req.body;
        var value1= post.value1;
        var value2= post.value2;
    }

    var message = ""
    var blur = "add-blur"
    var openPopup = "open-popup"
    var icon = "far fa-bell alig"
    var titlu = "Interogarea 4A"
    var cerinta = "Să se găsească pentru clientul cu numele '" + value1 + "' detaliile călătoriilor efectuate cu escală la " + value1 + ".";

    const tHead = ["Numar de zbor", "De la", "La", "Plecare"];

    var userId = req.session.userId;
    if(userId == null){
        res.redirect("/login");
        return;
    }

    var sql1="SELECT * FROM users WHERE id = ?";
    db.query(sql1, [userId], function(err, results){
        message = results[0].name;
       });

    var sql2 = "CALL interogare4A('" + value1 + "','" + value2 + "');";
    db.query(sql2, function(err, results){  
        if(err) {
            console.log(err);
        }
        else {

            const data = [];
            for(let i=0; i<results[0].length; i++){
                data[i] = [];
                data[i][0] = results[0][i].nrzbor;
                data[i][1] = results[0][i].de_la;
                data[i][2] = results[0][i].la;
                data[i][3] = results[0][i].Plecare;
            }

            res.render('interogari', {
                message: message,
                blur: blur,
                openPopup: openPopup, 
                icon: icon,
                titlu: titlu,
                cerinta: cerinta,
                tHead: tHead,
                results: data
            });
            
        }
    });
 };

 
exports.interogare4B = function(req, res){

    if(req.method == "POST"){
        var post  = req.body;
    }

    var message = ""
    var blur = "add-blur"
    var openPopup = "open-popup"
    var icon = "fas fa-address-book alig"
    var titlu = "Interogarea 4B"
    var cerinta = "Să se găsească perechi de cupoane (nrbilet, nrzbor1, plecare1, nrzbor2, plecare2) cu condiția să fie pentru același bilet. O pereche este unică în rezultat.";

    const tHead = ["Zbor1", "Plecare1", "Zbor2", "Plecare2"];

    var userId = req.session.userId;
    if(userId == null){
        res.redirect("/login");
        return;
    }

    var sql1="SELECT * FROM users WHERE id = ?";
    db.query(sql1, [userId], function(err, results){
        message = results[0].name;
       });

    var sql2 = "CALL interogare4B();";
    db.query(sql2, function(err, results){  
        if(err) {
            console.log(err);
        }
        else {

            const data = [];
            for(let i=0; i<results[0].length; i++){
                data[i] = [];
                data[i][0] = results[0][i].Zbor1;
                data[i][1] = results[0][i].Plecare1;
                data[i][2] = results[0][i].Zbor2;
                data[i][3] = results[0][i].Plecare2;
            }

            res.render('interogari', {
                message: message,
                blur: blur,
                openPopup: openPopup, 
                icon: icon,
                titlu: titlu,
                cerinta: cerinta,
                tHead: tHead,
                results: data
            });
            
        }
    });
 };

 exports.interogare5A = function(req, res){

    if(req.method == "POST"){
        var post  = req.body;
        var value1 = post.value1;
    }

    var message = ""
    var blur = "add-blur"
    var openPopup = "open-popup"
    var icon = "far fa-envelope-open alig"
    var titlu = "Interogarea 5A"
    var cerinta = "Să se găsească numele clienților al căror bilet are valoarea cea mai mică între biletele din clasa ’Business’.";

    const tHead = ["Nume", "Id. Client", "Valoare"];

    var userId = req.session.userId;
    if(userId == null){
        res.redirect("/login");
        return;
    }

    var sql1="SELECT * FROM users WHERE id = ?";
    db.query(sql1, [userId], function(err, results){
        message = results[0].name;
       });

    var sql2 = "CALL interogare5A('" + value1 + "');";
    db.query(sql2, function(err, results){  
        if(err) {
            console.log(err);
        }
        else {

            const data = [];
            for(let i=0; i<results[0].length; i++){
                data[i] = [];
                data[i][0] = results[0][i].nume;
                data[i][1] = results[0][i].idclient;
                data[i][2] = results[0][i].valoare;
            }

            res.render('interogari', {
                message: message,
                blur: blur,
                openPopup: openPopup, 
                icon: icon,
                titlu: titlu,
                cerinta: cerinta,
                tHead: tHead,
                results: data
            });
            
        }
    });
 };

 
 exports.interogare5B = function(req, res){

    if(req.method == "POST"){
        var post  = req.body;
        var value1 = post.value1;
        var value2 = post.value2;
    }

    var message = ""
    var blur = "add-blur"
    var openPopup = "open-popup"
    var icon = "far fa-id-badge alig"
    var titlu = "Interogarea 5B"
    var cerinta = "Să se găsească biletele clienților ce au același statut ca și clientul '" + value1 + "' și destinația '" + value1 + "'.";

    const tHead = ["Nr. bilet", "Clasa", "Valoare", "Sursa", "Destinatie"];

    var userId = req.session.userId;
    if(userId == null){
        res.redirect("/login");
        return;
    }

    var sql1="SELECT * FROM users WHERE id = ?";
    db.query(sql1, [userId], function(err, results){
        message = results[0].name;
       });

    var sql2 = "CALL interogare5B('" + value1 + "','" + value2 + "');";
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
            }

            res.render('interogari', {
                message: message,
                blur: blur,
                openPopup: openPopup, 
                icon: icon,
                titlu: titlu,
                cerinta: cerinta,
                tHead: tHead,
                results: data
            });
            
        }
    });
 };

 
 exports.interogare6A = function(req, res){

    if(req.method == "POST"){
        var post  = req.body;
        var value1 = post.value1;
    }

    var message = ""
    var blur = "add-blur"
    var openPopup = "open-popup"
    var icon = "fa fa-key alig"
    var titlu = "Interogarea 6A"
    var cerinta = "Să se găsească pentru fiecare zbor cu plecare în anul "+ value1 +" numărul de locuri ocupate.";

    const tHead = ["Nr. Zbor", "Locuri Ocupate"];

    var userId = req.session.userId;
    if(userId == null){
        res.redirect("/login");
        return;
    }

    var sql1="SELECT * FROM users WHERE id = ?";
    db.query(sql1, [userId], function(err, results){
        message = results[0].name;
       });

    var sql2 = "CALL interogare6A(" + value1 + ");";
    db.query(sql2, function(err, results){  
        if(err) {
            console.log(err);
        }
        else {

            const data = [];
            for(let i=0; i<results[0].length; i++){
                data[i] = [];
                data[i][0] = results[0][i].nrzbor;
                data[i][1] = results[0][i].Locuri_Ocupate;
            }

            res.render('interogari', {
                message: message,
                blur: blur,
                openPopup: openPopup, 
                icon: icon,
                titlu: titlu,
                cerinta: cerinta,
                tHead: tHead,
                results: data
            });
            
        }
    });
 };

 
 exports.interogare6B = function(req, res){

    if(req.method == "POST"){
        var post  = req.body;
    }

    var message = ""
    var blur = "add-blur"
    var openPopup = "open-popup"
    var icon = "fa fa-phone-square alig"
    var titlu = "Interogarea 6B"
    var cerinta = "Să se găsească pentru fiecare client valoarea minimă, medie și maximă a biletelor.";

    const tHead = ["Id. Client", "Valoare minima", "Valoare medie", "Valoare maxima"];

    var userId = req.session.userId;
    if(userId == null){
        res.redirect("/login");
        return;
    }

    var sql1="SELECT * FROM users WHERE id = ?";
    db.query(sql1, [userId], function(err, results){
        message = results[0].name;
       });

    var sql2 = "CALL interogare6B();";
    db.query(sql2, function(err, results){  
        if(err) {
            console.log(err);
        }
        else {

            const data = [];
            for(let i=0; i<results[0].length; i++){
                data[i] = [];
                data[i][0] = results[0][i].idclient;
                data[i][1] = results[0][i].Valoare_minima;
                data[i][2] = results[0][i].Valoare_medie;
                data[i][3] = results[0][i].Valoare_maxima;
            }

            res.render('interogari', {
                message: message,
                blur: blur,
                openPopup: openPopup, 
                icon: icon,
                titlu: titlu,
                cerinta: cerinta,
                tHead: tHead,
                results: data
            });
            
        }
    });
 };