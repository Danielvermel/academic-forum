parasails.registerPage('booklist', {

  data: {
    sortedOption: 'default'
  },

  methods: {
    sortedList: function (option) {
      if(option === 'nameUp'){
        this.books.sort((a, b) => (a.title > b.title) ? 1 : -1);
      } else if (option === 'nameDown'){
        this.books.sort((a, b) => (a.title < b.title) ? 1 : -1);
      } else if(option === 'dateUp'){
        this.books.sort((a, b) => (a.publicationDate > b.publicationDate) ? 1 : -1);
      }else if (option === 'dateDown'){
        this.books.sort((a, b) => (a.publicationDate < b.publicationDate) ? 1 : -1);
        console.log(JSON.stringify(this.books))
      }
    }
  }
});