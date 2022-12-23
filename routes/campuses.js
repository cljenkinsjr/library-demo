let express = require("express");
let router = express.Router();
let dbConn = require("../lib/db");

// display campuses on the page
router.get("/", function (req, res, next) {
  dbConn.query(
    "SELECT * FROM campus ORDER BY campus_id desc",
    function (err, rows) {
      if (err) {
        req.flash("error", err);
        // render to view/campuses/index.ejs
        res.render("campuses", { data: "" });
      } else {
        // render to view/campuses/index.ejs
        res.render("campuses", { data: rows });
      }
    }
  );
});

// display add campuses page
router.get("/add", function (req, res, next) {
  //render to add.js
  res.render("campuses/add", {
    location: "",
  });
});

// add a new book
router.post("/add", function (req, res, next) {
  let name = req.body.location;
  let errors = false;

  if (location.length === 0) {
    errors = true;

    req.flash("error", "Please enter name and author");
    // render to add.ejs with flash message
    res.render("books/add", {
      location: location,
    });
  }

  if (!errors) {
    let formData = {
      location: location,
    };

    dbConn.query("INSERT INTO campus SET ?", formData, function (err, result) {
      if (err) {
        req.flash("error", err);

        res.render("campuses/add", {
          location: location,
        });
      } else {
        req.flash("Success", "Campus successfully added");
        res.redirect("/campuses");
      }
    });
  }
});

module.exports = router;
