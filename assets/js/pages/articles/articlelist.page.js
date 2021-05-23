parasails.registerPage('articlelist', {
  data: {
    sortedOption: 'default'
  },

  methods: {
    sortedList: function (option) {
      if(option === 'nameUp'){
        this.articles.sort((a, b) => (a.title > b.title) ? 1 : -1);
      } else if (option === 'nameDown'){
        this.articles.sort((a, b) => (a.title < b.title) ? 1 : -1);
      } else if(option === 'dateUp'){
        this.articles.sort((a, b) => (a.publicationDate > b.publicationDate) ? 1 : -1);
      }else if (option === 'dateDown'){
        this.articles.sort((a, b) => (a.publicationDate < b.publicationDate) ? 1 : -1);
      }
    }
  }
});
