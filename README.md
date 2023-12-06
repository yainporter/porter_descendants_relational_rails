# CRUD Relational Rails

## Learning Goals

Design a one-to-many relationship using a schema designer.
Write migrations to create tables with columns of varying data types and foreign keys.
Use Rails to create web pages that allow users to CRUD resources.
Create instance and class methods on a Rails model that use ActiveRecord methods and helpers.
Write model and feature tests that fully cover data logic and user behavior.

## Requirements

Must use Rails 7.0.x, Ruby 3.2.2
Must use PostgreSQL
Must “handroll” all routes (no use of resources syntax)
Use of scope syntax is not permitted on this project
Use of scaffolding syntax is not permitted on this project

## Gems used:
  gem "pry"
  gem "rspec-rails"
  gem "simplecov"
  gem "capybara"
  gem "launchy"
  gem "orderly"  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "pry"
  gem "rspec-rails"
  gem "simplecov"
  gem "capybara"
  gem "launchy"
  gem "orderly"
  gem "shoulda-matchers", "~> 5.0"
  gem "shoulda-matchers", "~> 5.0"

## Iteration 1
#### git CRUD
<dl>
  <dt>[X] done </dt>
  <dt>User Story 1, Parent Index</dt>
  <dd> For each parent table </dd>
  <dd>As a visitor
  <dd><dd>When I visit '/parents'
  <dd>  <dd>Then I see the name of each parent record in the system</dd>
</dl>

<dl>
  <dt>[X] done </dt>
  <dt>User Story 2, Parent Show</dt>
  <dd>As a visitor
  <dd>When I visit '/parents/:id'
  <dd>Then I see the parent with that id including the parent's attributes
(data from each column that is on the parent table)
  <dd>
</dl>
<dl>
  <dt>[X] done </dt>
  <dt>User Story 3, Child Index</dt>
  <dd>As a visitor
<dd>When I visit '/child_table_name'
  <dd>Then I see each Child in the system including the Child's attributes
(data from each column that is on the child table)
</dl>
<dl>
  <dt>[X] done </dt>
  <dt>User Story 4, Child Show </dt>
  <dd>As a visitor
<dd>When I visit '/child_table_name/:id'
  <dd>Then I see the child with that id including the child's attributes
(data from each column that is on the child table)
</dl>
<dl>
  <dt>[X] done </dt>
  <dt>User Story 5, Parent Children Index</dt>
  <dd>As a visitor
<dd>When I visit '/parents/:parent_id/child_table_name'
  <dd>Then I see each Child that is associated with that Parent with each Child's attributes
(data from each column that is on the child table)
</dl>

#### ActiveRecord
<dl>
  <dt>[X] done </dt>
  <dt>User Story 6, Parent Index sorted by Most Recently Created </dt>
  <dd>As a visitor
<dd>When I visit the parent index,
I see that records are ordered by most recently created first
And next to each of the records I see <dd>when it was created
</dl>
<dl>
  <dt>[X] done </dt>
  <dt>User Story 7, Parent Child Count</dt>
  <dd>As a visitor
<dd>When I visit a parent's show page
I see a count of the number of children associated with this parent
</dl>

#### Usability
<dl>
  <dt>[X] done </dt>
  <dt>User Story 8, Child Index Link</dt>
  <dd>As a visitor
<dd>When I visit any page on the site
  <dd>Then I see a link at the top of the page that takes me to the Child Index
</dl>
<dl>
  <dt>[X] done </dt>
  <dt>User Story 9, Parent Index Link</dt>
  <dd>As a visitor
<dd>When I visit any page on the site
  <dd>Then I see a link at the top of the page that takes me to the Parent Index
</dl>
<dl>
  <dt>[X] done </dt>
  <dt>User Story 10, Parent Child Index Link</dt>
  <dd>As a visitor
<dd>When I visit a parent show page ('/parents/:id')
  <dd>Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')
</dl>

## Iteration 2
#### CRUD
<dl>
  <dt>[X] done </dt>
  <dt>User Story 11, Parent Creation </dt>
  <dd>As a visitor
<dd>When I visit the Parent Index page
  <dd>Then I see a link to create a new Parent record, "New Parent"
<dd>When I click this link
  <dd>Then I am taken to '/parents/new' where I  see a form for a new parent record
<dd>When I fill out the form with a new parent's attributes:
And I click the button "Create Parent" to submit the form
  <dd>Then a `POST` request is sent to the '/parents' route,
a new parent record is created,
and I am redirected to the Parent Index page where I see the new Parent displayed.
</dl>
<dl>
  <dt>[X] done </dt>
  <dt>User Story 12, Parent Update </dt>
  <dd>As a visitor
<dd>When I visit a parent show page
  <dd>Then I see a link to update the parent "Update Parent"
<dd>When I click the link "Update Parent"
  <dd>Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
<dd>When I fill out the form with updated information
And I click the button to submit the form
  <dd>Then a `PATCH` request is sent to '/parents/:id',
the parent's info is updated,
and I am redirected to the Parent's Show page where I see the parent's updated info
</dl>
<dl>
  <dt>[X] done </dt>
  <dt>User Story 13, Parent Child Creation</dt>
  <dd>As a visitor
<dd>When I visit a Parent Children Index page
  <dd>Then I see a link to add a new adoptable child for that parent "Create Child"
<dd>When I click the link
I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
<dd>When I fill in the form with the child's attributes:
And I click the button "Create Child"
  <dd>Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
a new child object/row is created for that parent,
and I am redirected to the Parent Childs Index page where I can see the new child listed

</dl>
<dl>
  <dt>[X] done </dt>
  <dt>User Story 14, Child Update </dt>
  <dd>As a visitor
<dd>When I visit a Child Show page
  <dd>Then I see a link to update that Child "Update Child"
<dd>When I click the link
I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
<dd>When I click the button to submit the form "Update Child"
  <dd>Then a `PATCH` request is sent to '/child_table_name/:id',
the child's data is updated,
and I am redirected to the Child Show page where I see the Child's updated information
</dl>
<dl>
  <dt>[X] done </dt>
  <dt>User Story 15, Child Index only shows `true` Records ** feature removed</dt>
  <dd>As a visitor
<dd>When I visit the child index
  <dd>Then I only see records where the boolean column is `true`
</dl>
<dl>
  <dt>[X] done </dt>
  <dt>User Story 16, Sort Parent's Children in Alphabetical Order by name </dt>
  <dd>As a visitor
<dd>When I visit the Parent's children Index Page
  <dd>Then I see a link to sort children in alphabetical order
<dd>When I click on the link
I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
</dl>

#### Usability
<dl>
  <dt>[X] done </dt>
  <dt>User Story 17, Parent Update From Parent Index Page</dt>
  <dd>As a visitor
<dd>When I visit the parent index page
Next to every parent, I see a link to edit that parent's info
<dd>When I click the link
I should be taken to that parent's edit page where I can update its information just like in User Story 12
</dl>
<dl>
  <dt>[X] done </dt>
  <dt>User Story 18, Child Update From Childs Index Page </dt>
  <dd>As a visitor
<dd>When I visit the `child_table_name` index page or a parent `child_table_name` index page
Next to every child, I see a link to edit that child's info
<dd>When I click the link
I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 14
</dl>

## Iteration 3
#### CRUD
<dl>
  <dt>[X] done </dt>
  <dt>User Story 19, Parent Delete</dt>
  <dd>As a visitor
<dd>When I visit a parent show page
  <dd>Then I see a link to delete the parent
<dd>When I click the link "Delete Parent"
  <dd>Then a 'DELETE' request is sent to '/parents/:id',
the parent is deleted, and all child records are deleted
and I am redirected to the parent index page where I no longer see this parent
</dl>
<dl>
  <dt>[X] done </dt>
  <dt>User Story 20, Child Delete</dt>
  <dd>As a visitor
<dd>When I visit a child show page
  <dd>Then I see a link to delete the child "Delete Child"
<dd>When I click the link
  <dd>Then a 'DELETE' request is sent to '/child_table_name/:id',
the child is deleted,
and I am redirected to the child index page where I no longer see this child
</dl>
#### ActiveRecord
<dl>
  <dt>[X] done </dt>
  <dt>User Story 21, Display Records Over a Given Threshold</dt>
  <dd>As a visitor
<dd>When I visit the Parent's children Index Page
I see a form that allows me to input a number value
<dd>When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
  <dd>Then I am brought back to the current index page with only the records that meet that threshold shown.
</dl>
#### Usability
<dl>
  <dt>[X] done </dt>
  <dt>User Story 22, Parent Delete From Parent Index Page</dt>
  <dd>As a visitor
<dd>When I visit the parent index page
Next to every parent, I see a link to delete that parent
<dd>When I click the link
I am returned to the Parent Index Page where I no longer see that parent
</dl>
<dl>
  <dt>[X] done </dt>
  <dt>User Story 23, Child Delete From Childs Index Page</dt>
As a visitor
<dd>When I visit the `child_table_name` index page or a parent `child_table_name` index page
Next to every child, I see a link to delete that child
<dd>When I click the link
I should be taken to the `child_table_name` index page where I no longer see that child
</dl>
## Extensions
<dl>
  <dt>[X] done </dt>
  <dt>Extension 1: Sort Parents by Number of Children</dt>
As a visitor
<dd>When I visit the Parents Index Page
  <dd>Then I see a link to sort parents by the number of `child_table_name` they have
<dd>When I click on the link
I'm taken back to the Parent Index Page where I see all of the parents in order of their count of `child_table_name` (highest to lowest) And, I see the number of children next to each parent name
</dl>
<dl>
  <dt>[X] done </dt>
  <dt>Extension 2: Search by name (exact match)</dt>
  <dd>As a visitor
<dd>When I visit an index page ('/parents') or ('/child_table_name')
  <dd>Then I see a text box to filter results by keyword
<dd>When I type in a keyword that is an exact match of one or more of my records and press the Search button
  <dd>Then I only see records that are an exact match returned on the page
</dl>
<dl>
  <dt>[ ] done </dt>
  <dt>Extension 3: Search by name (partial match)</dt>
  <dd>As a visitor
<dd>When I visit an index page ('/parents') or ('/child_table_name')
  <dd>Then I see a text box to filter results by keyword
<dd>When I type in a keyword that is an partial match of one or more of my records and press the Search button
  <dd>Then I only see records that are an partial match returned on the page

This functionality should be separate from your exact match functionality.
</dl>