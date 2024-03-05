const e = require("express");

exports.index = function(req, res) {
	var message = '';
	userId = req.session.userId;
	var sql="SELECT * FROM users WHERE id = ?";

	if(userId == null){
		res.render('index.ejs', {
			message: message,
			error: "" 
		});
	}
	else {
		db.query(sql, [userId], function(err, results){
			res.render('dashboard.ejs', {message: results[0].name});    
		   });
	}
};

exports.interogari = function(req, res) {
	var message = '';
	userId = req.session.userId;
	var sql="SELECT * FROM users WHERE id = ?";

	if(userId == null){
		res.render('index.ejs', {
			message: message,
			error: "" 
		});
	}
	else {
		db.query(sql, [userId], function(err, results){
			res.render('interogari.ejs', {
				message: results[0].name,  
				blur: "",
                openPopup: "", 
				icon: "",
                titlu: "",
                cerinta: "",
				tHead: "",
                results: results
			});    
		   });
	}
};