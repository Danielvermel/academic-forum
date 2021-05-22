module.exports = {


  friendlyName: 'View bookspage',


  description: 'Display "" page.',


  exits: {

    success: {
      viewTemplatePath: 'pages/bookspage'
    }

  },


  fn: async function () {

    // Respond with view.
    var data = await Books.find({});
    return {
      booksData: data,
    };
  }


};
