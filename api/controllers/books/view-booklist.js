module.exports = {


  friendlyName: 'View booklist',


  description: 'Display "Booklist" page.',


  exits: {

    success: {
      viewTemplatePath: 'pages/books/booklist'
    }

  },


  fn: async function (inputs, exits) {

    // let books = await BooksView.find();
    let books = await Books.find();
    // Respond with view.
    return exits.success({
      books
    });

  }


};
