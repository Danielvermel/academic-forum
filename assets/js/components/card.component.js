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

parasails.registerComponent('card', {

  props: {
    data: {
      type: Object,
      required: true
    },
    url: {
      type: String,
      required: false
    }
  },

  data: function (){
    return {

    };
  },

  template: `
    <article class="my-4 col-12 col-md-6 col-lg-4 col-xl-2 card-container rounded" :id="data.id">
      <a :href="'/'+url+'/' + data.id">
          <figure class="card card-size m-0">
              <img class="card-img-top" :src="data.urlCoverPhoto" :alt="data.title">
              <figcaption>
              <h6 class="card-title">{{data.title.slice(0, 45)}}<span v-if="data.title.length > 45">...</span></h6>
              
              <button type="button" class="btn btn-outline-light card-button">Get info</button>       
              
          </figcaption>
          </figure>
      </a>
  </article>
  `,
});
