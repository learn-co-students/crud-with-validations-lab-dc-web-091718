# CRUD With Validations Lab

Your goal in this lab is to create a thorough CRUD interface for one model, the
`Song`.

## Songs

Songs have the following attributes and limitations:

d- `title`, a `string`
  d- Must not be blank
  - Cannot be repeated by the same artist in the same year
d- `released`, a `boolean` describing whether the song was ever officially
  released.
  d - Must be `true` or `false`
d- `release_year`, an `integer`
  - Optional if `released` is `false`
  - Must not be blank if `released` is `true`
  m - Must be less than or equal to the current year
d- `artist_name`, a `string`
  d- Must not be blank
d- `genre`, a `string`

## Requirements

Use the `resource` generator, **not** the `scaffold` generator

1.  Define a model with validations for `Song`

2.  Define all RESTful routes for songs

3.  Build views that connect to each other using route helpers.

4.  Use `form_for` to build forms with pre-fill and error list features. (_Hint:
    Try using a partial to cut down on copy/pasting!_)

5.  Allow deleting songs with a link, using `link_to`. Check out the [official
    documentation][link_to] for additional info including setting the `method:` to
    `:delete`.

6.  Be sure to [include your new assets][assets] in `application.html.erb`

7.  Use strong parameters in your POST/PATCH controller actions.

8.  Set the root route to the song index.

9.  Render the list of songs in an HTML table.

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/crud-with-validations-lab' title='CRUD With Validations Lab'>CRUD With Validations Lab</a> on Learn.co and start learning to code for free.</p>

[link_to]: http://api.rubyonrails.org/classes/ActionView/Helpers/UrlHelper.html#method-i-link_to
[assets]: http://apidock.com/rails/v4.2.1/ActionView/Helpers/AssetTagHelper/javascript_include_tag
