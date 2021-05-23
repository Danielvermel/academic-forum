/**
 * <modal>
 * -----------------------------------------------------------------------------
 * A modal dialog pop-up.
 *
 * > Be careful adding other Vue.js lifecycle callbacks in this file!  The
 * > finnicky combination of Vue transitions and bootstrap modal animations used
 * > herein work, and are very well-tested in practical applications.  But any
 * > changes to that specific cocktail could be unpredictable, with unsavory
 * > consequences.
 *
 * @type {Component}
 *
 * -----------------------------------------------------------------------------
 */

parasails.registerComponent('record', {

  props: {
    data: {
      type: Array,
      required: true
    },
  },

  data: function (){
    return {
      isBook: undefined
    };
  },

  beforeMount: function() {
    this.isBook = this.data[0].publisher ? true : false;
  },

  template: `
    <section class="row">
    
      <div  :class="{
        'col-6': isBook,
        'col-4': !isBook,
      }">
        <img class="rounded mx-auto record-img float-left" :src="data[0].urlCoverPhoto"/>
      </div>

      <div :class="{
        'col-6': isBook,
        'col-8': !isBook,
      }">
        <h4>Title</h4>
        <p>{{data[0].title}}</p>
        
        <h4 v-if="data[0].author.match(/\,/g) != null && data[0].author.match(/\,/g).length >= 1">Authors</h4>
        <h4 v-else>Author</h4>
        
        <p>{{data[0].author}}</p>
        
        <h4>Publication Date</h4>
        <p>{{data[0].publicationDate}}</p>
        
        <div v-if="data[0].publisher">
          <h4> Publisher</h4>
          <p>{{data[0].publisher}}</p>
        </div>

        <div v-if="data[0].journalPublished">
          <h4> Issue Published</h4>
          <p>{{data[0].journalPublished}}</p>
        </div>
        
        <div v-if="data[0].journalIssueNumber">
          <h4> Issue Number</h4>
          <p>{{data[0].journalIssueNumber}}</p>
        </div>      
      </div>

    </section>
  `,
});
