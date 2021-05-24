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
    };
  },

  template: `
    <section class="row">
    
      <div  class="col-3">
        <img class="rounded mx-auto record-img float-left" :src="data[0].urlCoverPhoto"/>
      </div>

      <div class="col-8 offset-1">
        <h4 class="mb-5">{{data[0].title}}</h4>
          
          <div class="row mb-5">
            
            <div class="col-4">
              <h5 v-if="data[0].author.match(/\,/g) != null && data[0].author.match(/\,/g).length >= 1">Authors</h5>
              <h5 v-else>Author</h5>
              
              <p>{{data[0].author}}</p>
            
              <h5>Publication Date</h5>
              <p>{{data[0].publicationDate.slice(0,10)}}</p>
            
              <div v-if="data[0].publisher">
                <h5> Publisher</h5>
                <p>{{data[0].publisher}}</p>
              </div>

              <div  v-if="data[0].journalPublished">
                <h5> Issue Published</h5>
                <p>{{data[0].journalPublished}}</p>
              </div>
              
              <div v-if="data[0].journalIssueNumber">
                <h5> Issue Number</h5>
                <p>{{data[0].journalIssueNumber}}</p>
              </div>    
            </div>  

            <div class="col-8">

              <h5>Description</h5>
              <p class="text-justify">
                {{data[0].description.slice(0,700)}} <span v-if="data[0].description.length > 700">...</span>
              </p>
            </div>

          </div>
      </div>

    </section>
  `,
});
