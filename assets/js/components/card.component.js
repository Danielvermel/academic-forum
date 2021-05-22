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

  props: [
    'data'
  ],

  data: function (){
    return {
    
    };
  },

  template: `
    <article class="mb-3 col-12 col-md-6 col-lg-4 col-xl-3 card-container rounded" id="data.id">
      <a :href="'/books/' + data.id">
          <div class="card card-size">
              <img class="card-img-top" :src="data.urlCoverPhoto" :alt="data.title">
          </div>
      </a>
  </article>
  `,
});
