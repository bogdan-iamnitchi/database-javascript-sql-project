
exports.signup = function(req, res){
   message = '';
   if(req.method == "POST"){
      var post  = req.body;

      var name= post.name;
      var email= post.email;
      var password= post.password;
      var con_password= post.con_password;
      
      if(name == "" || email == "" || password == "" || con_password == ""){
         message = "Hopa! Nu ai completat toate campurile!";
         res.render('signup', {message: message});
         return;
      }

      if(password != con_password){
         message = "Hopa! Cele doua parole nu corespund!";
         res.render('signup', {message: message});
         return;
      }

      var sql = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";

      var query = db.query(sql,[name, email, password], function(err, result) {
         
         message = "Ai reusit! Contul tau a fost creat cu succes. Te rugam sa intri in cont:";
         res.render('index.ejs', {
            message: message,
            error: "form__input-succes-message" 
         });
      });

   } else {
      res.render('signup');
   }
};
 
//-----------------------------------------------login page call------------------------------------------------------
exports.login = function(req, res){
   var message = '';
   var sess = req.session; 
   userId = req.session.userId;

   if(req.method == "POST"){
      var post  = req.body;

      var email= post.email;
      var password= post.password;
     
      var sql="SELECT id, name, email, password FROM users WHERE email = ? and password = ?";                           
      db.query(sql,[email, password], function(err, results){      
         if(results.length){
            req.session.userId = results[0].id;
            req.session.user = results[0];
            console.log(results[0].id);
            res.redirect('/home/dashboard');
         }
         else{
            message = 'Email-ul sau paroala sunt gresite! Incearca din nou:';
            res.render('index.ejs', {
               message: message,
               error: "form__input-error-message" 
            });
         }
      
      });
   } else {
      res.render('index.ejs', {
			message: message,
			error: "" 
		});
   }
};
//-----------------------------------------------dashboard page functionality----------------------------------------------
           
exports.dashboard = function(req, res, next){
   var user =  req.session.user,
   userId = req.session.userId;

   console.log('ddd='+userId);
   if(userId == null){
      res.redirect("/login");
      return;
   }

   var sql="SELECT * FROM users WHERE id = ?";

   db.query(sql, [userId], function(err, results){
      res.render('dashboard.ejs', {message: results[0].name});    
   });       
};
//------------------------------------logout functionality----------------------------------------------
exports.logout=function(req,res){
   req.session.destroy(function(err) {
      res.redirect("/login");
   })
};

