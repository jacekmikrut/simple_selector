simple_selector
===============

simple_selector is a Ruby gem that **represents a CSS-like selector**, calculates its **specificity** and tells if it **matches** given HTML-like tags.

Content
-------

The selector content can consist of **tag names**, **IDs** and **class names**. An example:

```ruby
  SimpleSelector.new("tag_a#id_a.class_a #id_b .class_c.class_d")
```

Specificity
-----------

#### Calculation rules

The specificity of a selector is calculated according to rules similar to the standard CSS rules.

The specificity is four numbers: **a,b,c,d**.

**The rules respected by this gem are**:

* **a** is always 0;
* **b** is the number of ID attributes in the selector;
* **c** is the number of class names in the selector;
* **d** is the number of tag names in the selector.

For example, a selector `tag#id1.class1 #id2.class2.class3` has specificity equal to `0,2,3,1`.

```ruby
  SimpleSelector.new("tag#id1.class1 #id2.class2.class3").specificity
   => #<SimpleSelector::Specificity "0,2,3,1">
```

#### Comparison

Specificity allows selector comparison.

Two selector specificities are compared by succesively comparing their corresponding numbers, from left to right.

Tag matching
------------

A SimpleSelector object tells if it matches given HTML-like tags.

The tag is expected to be represented by an object which responds to :name, :id, :class_names and :parent messages. An example:

```ruby
  Tag = Struct.new(:name, :id, :class_names, :parent)

  # Tag objects corresponding to the structure:
  # <section id="content"><message class="success">...</message></section>
  content_tag = Tag.new("section", "content", [], nil)
  message_tag = Tag.new("message", nil, ["success"], content_tag)
```

And now:

```ruby
  SimpleSelector.new("section#content message.success").match?(message_tag)
   => true
```

Installation
------------

As a Ruby gem, simple_selector can be installed either by running

```bash
  gem install simple_selector
```

or adding

```ruby
  gem "simple_selector"
```

to the Gemfile and then invoking `bundle install`.

License
-------

License is included in the LICENSE file.
