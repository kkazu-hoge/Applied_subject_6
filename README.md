# README

search pulldown data insert
$ rails c

pry > QueryCode.create([
{category_name: "header_search_clf", category_param_name: "完全一致", category_param_value: 1},
{category_name: "header_search_clf", category_param_name: "前方一致", category_param_value: 2},
{category_name: "header_search_clf", category_param_name: "後方一致", category_param_value: 3},
{category_name: "header_search_clf", category_param_name: "部分一致", category_param_value: 4},
{category_name: "header_search_tgt_clf", category_param_name: "User", category_param_value: 1},
{category_name: "header_search_tgt_clf", category_param_name: "Book", category_param_value: 2}
])

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
