*mangia mangia mangia mangia mangia!*

TODO:
  * instead of a form, just tap at the bottom of the screen to make a new grocery, have default fields of in stock, current use, or use notie js to confirm user after its been created?
  * ~remove zurb foundation, replace with bourbon/neat/bitters~ figure out what CSS framework I want to use
  * Just make a category component with a grocerylist child for consistency
    * not sure that is a great idea, it will cause far more network calls
  * make consistent naming between `household_id` and `house_hold_id`
  * easier to use /new/ form
  * way to hide/delete old groceries
  * a detailed view you should hold or double tap to navigate to
  * deployment with capistrano

DONE:
  * 0,1,5 do not make sense for quantity codes, use something like 0,100,200
  * add categories with their own sections and subsections
  * unit tests
  * update `GroceryList` component to take a name param and match new schema
  * use sprockets for js / scss
  * write front end in react
  * have swipe events change state in backend
  * have swipe reorganize existing groceries
  * properly config nginx

Don't forget to run:

`rake assets:precompile`

after deployment

