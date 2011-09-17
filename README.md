# HTMLSchema

> For Schema Draft Version 0.9

- http://mbostock.github.com/d3/ex/tree.html
- http://mbostock.github.com/d3/ex/cluster.html
- http://bl.ocks.org/1020117
- http://bl.ocks.org/1166403
- interactive tree: http://bl.ocks.org/1061834
- dynamic tree: http://bl.ocks.org/999346

http://code.lancepollard.com/projects/html-schema/microdata
http://code.lancepollard.com/projects/html-schema/address
http://code.lancepollard.com/projects/html-schema # schema itself
http://code.lancepollard.com/projects/guard-javascript-templates
http://code.lancepollard.com/projects/tagged-with/guard

This is a Ruby interface to the HTML5 microdata schema at [schema.org](http://schema.org), and the HTML microformats at [microformat.org](http://microformat.org).  This doesn't force any markup conventions upon you, it just gives you a hash for common semantic models and attributes.  If you want some semantic markup conventions, use  [storefront](http://github.com/biglobby/storefront).

WORK IN PROGRESS.

## Overview

This library's only dependency is `active_support`.  It doesn't depend on any particular web framework or template engine, so it's abstract enough to plug into the dozens that are out there.

Everything is configurable, so you can opt out of the any markup schema.  By default, all microformats are enabled.  [todo]

Checkout the [wiki](http://github.com/biglobby/html-schema/wiki) for all the details.  [todo]

The wiki here will also serve as a community-driven knowledge base of how to apply these schemas to markup "edge cases".  And what you should/shouldn't include to balance SEO with site performance (too many tags and attributes).

See [htmlschema.org](http://htmlschema.org) for an example for every microdata, microformat, and aria implementation.  [todo] 

## API

All of the microformats can be boiled down into this schema, which is an abstraction layer on top of the microdata and microformat implementations:

- Address
- Article
- Citation
- Contact
  - Person
  - Organization
    - Vendor
- Coordinates
- Event
- Figure
- Measurement
- Media
  - Audio
  - Image
  - Video
- Offer
- Product
- Tag
- Rating
- Review

## Usage

### Install

``` bash
gem install html-schema
```

### Model

``` ruby
schema = HTMLSchema.new
```

### Address

``` ruby
schema.address.to_hash.should         == {
  :itemprop  => "address", 
  :itemscope => "itemscope", 
  :itemtype  => "http://schema.org/PostalAddress",
  :class     => "adr"
}
schema.address.street.to_hash.should  == {
  :itemprop  => "streetAddress",
  :class     => "street-address"
}
schema.address.suite.to_hash.should  == {
  :class     => "extended-address"
}
schema.address.city.to_hash.should  == {
  :itemprop  => "addressLocality",
  :class     => "locality"
}
schema.address.state.to_hash.should  == {
  :itemprop  => "addressRegion",
  :class     => "region"
}
schema.address.postal_code.to_hash.should  == {
  :itemprop  => "postalCode",
  :class     => "postal-code"
}
schema.address.post_office_box.to_hash.should  == {
  :itemprop  => "postOfficeBoxNumber",
  :class     => "post-office-box"
}
schema.address.country.to_hash.should  == {
  :itemprop  => "addressCountry",
  :class     => "country-name"
}
```

### Article

``` ruby
schema.article.feed.to_hash.should  == {
  :class     => "hfeed"
}
schema.article.to_hash.should  == {
  :itemscope => "itemscope", 
  :itemtype  => "http://schema.org/Article",
  :class     => "hentry"
}
schema.article.title.to_hash.should  == {
  :itemprop  => "name", 
  :class     => "entry-title"
}
schema.article.description.to_hash.should  == {
  :itemprop  => "description", 
  :class     => "entry-summary"
}
schema.article.body.to_hash.should  == {
  :itemprop  => "articleBody", 
  :class     => "entry-content"
}
schema.article.updated_at.to_hash.should  == {
  :class     => "updated"
}
schema.article.published_at.to_hash.should  == {
  :itemprop  => "datePublished", 
  :class     => "published"
}
schema.article.author.to_hash.should  == {
  :itemprop  => "author", 
  :itemscope => "itemscope", 
  :itemtype  => "http://schema.org/Person",
  :class     => "author vcard"
}
schema.article.tag.to_hash.should  == {
  :itemprop  => "keywords",
  :class     => "category",
  :rel       => "tag"
}
```

### Coordinates

``` ruby
schema.coordinates.to_hash.should  == {
  :itemprop  => "geo", 
  :itemscope => "itemscope", 
  :itemtype  => "http://schema.org/GeoCoordinates",
  :class     => "geo"
}
schema.coordinates.latitude.to_hash.should  == {
  :itemprop  => "latitude",
  :class     => "lat"
}
schema.coordinates.longitude.to_hash.should  == {
  :itemprop  => "longitude",
  :class     => "lng"
}
```

### Event

``` ruby
schema.event.to_hash.should  == {
  :itemscope => "itemscope", 
  :itemtype  => "http://schema.org/Event",
  :class     => "vevent"
}
schema.event.description.to_hash.should  == {
  :itemprop  => "description",
  :class     => "summary"
}
schema.event.start_date.to_hash.should  == {
  :itemprop  => "startDate",
  :class     => "dtstart"
}
schema.event.end_date.to_hash.should  == {
  :itemprop  => "endDate",
  :class     => "dtend"
}
schema.event.id.to_hash.should  == {
  :class     => "uid"
}
schema.event.kind.to_hash.should  == {
  :class     => "class"
}
schema.event.category.to_hash.should  == {
  :class     => "category",
  :rel       => "tag"
}
schema.event.location.to_hash.should  == {
  :itemprop  => "location",
  :itemscope => "itemscope", 
  :itemtype  => "http://schema.org/PostalAddress",
  :class     => "location adr"
}
```

### Media

``` ruby
schema.media.to_hash.should  == {
  :itemscope => "itemscope", 
  :itemtype  => "http://schema.org/Media",
  :class     => "hmedia"
}
schema.media.title.to_hash.should  == {
  :itemscope => "name",
  :class     => "fn"
}
schema.media.url.to_hash.should  == {
  :itemscope => "url",
  :class     => "photo"
}
schema.media.author.to_hash.should  == {
  :itemprop  => "author", 
  :itemscope => "itemscope", 
  :itemtype  => "http://schema.org/Person",
  :class     => "contributor vcard"
}
schema.media.player.to_hash.should  == {
  :itemprop  => "player",
  :class     => "player"
}
schema.image.to_hash.should  == {
  :itemscope => "itemscope", 
  :itemtype  => "http://schema.org/ImageObject",
  :class     => "hmedia"
}
schema.video.to_hash.should  == {
  :itemscope => "itemscope", 
  :itemtype  => "http://schema.org/VideoObject",
  :class     => "hmedia"
}
schema.audio.to_hash.should  == {
  :itemscope => "itemscope", 
  :itemtype  => "http://schema.org/AudioObject",
  :class     => "hmedia"
}
```

### Offer

``` ruby
schema.offer.to_hash.should  == {
  :itemscope => "itemscope", 
  :itemtype  => "http://schema.org/Offer",
  :class     => "hlisting"
}
schema.offer.item.to_hash.should  == {
  :itemscope => "itemscope", 
  :itemtype  => "http://schema.org/Article",
  :class     => "item hentry"
}
schema.offer.description.to_hash.should  == {
  :class     => "description summary"
}
```

### Organization

``` ruby
schema.organization.to_hash.should  == {
  :itemscope => "itemscope", 
  :itemtype  => "http://schema.org/Organization",
  :class     => "org"
}
```

### Person

``` ruby
schema.person.to_hash.should  == {
  :itemscope => "itemscope", 
  :itemtype  => "http://schema.org/Person",
  :class     => "vcard"
}
```

### Place

``` ruby

```

### Product

``` ruby
schema.product.to_hash.should  == {
  :itemscope => "itemscope", 
  :itemtype  => "http://schema.org/Product",
  :class     => "hProduct"
}
```

### Rating

``` ruby
schema.rating.to_hash.should  == {
  :itemscope => "itemscope", 
  :itemtype  => "http://schema.org/Rating",
  :class     => "hRating"
}
```

### Resume

``` ruby
schema.resume.to_hash.should  == {
  :class     => "hresume"
}
schema.resume.experience.feed.to_hash.should  == {
  :class     => "vcalendar"
}
schema.resume.experience.to_hash.should  == {
  :class     => "experience vevent"
}
schema.resume.skill.to_hash.should  == {
  :class     => "skill",
  :rel       => "tag"
}
```

### Review

``` ruby
schema.review.to_hash.should  == {
  :itemscope => "itemscope", 
  :itemtype  => "http://schema.org/Review",
  :class     => "hreview"
}
```

### Vendor

``` ruby
schema.vendor.to_hash.should  == {
  :itemscope => "itemscope", 
  :itemtype  => "http://schema.org/LocalBusiness",
  :class     => "org"
}
```

## Rendering

``` haml
%address{htmlschema.address.to_hash}
  %span.city{htmlschema.address.city.to_hash}= model.city
  %span.state{htmlschema.address.state.to_hash}= model.state
```

``` html
<address itemscope="itemscope" itemtype="http://schema.org/PostalAddress">
  <span class="city locality" itemprop="locality">San Diego</span>
  <span class="state region" itemprop="region">CA</span>
</address>
```

## Creating Your Own Schemas

You guys are the ideal people for creating these markup schemas.  You're out there in the trenches modeling the content, creating the database tables, building apps, so you know the attributes and objects that need to have proper HTML schemas.  I have always felt that the attributes that the formal organizations come up with (microformats and schema.org) are a little too disconnected.  Plus, they count on us.  Google, Microsoft, and Yahoo find patterns in _our_ html, and construct these standards.  So, why not help them out?

## Resources

[Tantek Çelik](http://tantek.com/) is the man.

- [Best Practices for Semantic `ids` and `classes`](http://meiert.com/en/blog/20080812/best-practice-ids-and-classes/)

### Microdata

#### Todo

- Sometimes you want say an `author` just as text, not as an object.  Handle that.

### Microformats

- [Address](http://microformats.org/wiki/adr)
- [hAtom](http://microformats.org/wiki/hatom)
- [hNews](http://microformats.org/wiki/hnews)
- The `rel` attribute
- [Microformat Principles](http://microformats.org/wiki/principles)
  - design for humans first, machines second
  - adapt to current behaviors and usage patterns
  - ease of authoring is important
- [Microformat Naming Principles](http://microformats.org/wiki/naming-principles)
- [Microformat Advocacy](http://microformats.org/wiki/advocacy)
- [List of All `class` Names](http://microformats.org/wiki/existing-class-names)
- [List of All `rel` Values](http://microformats.org/wiki/existing-rel-values)

Event and Article "collections" (hfeed, hcalendar).  What are the schema equivalents?

#### Todo

- [XFN](http://gmpg.org/xfn/)
- [rel](http://microformats.org/wiki/existing-rel-values)

#### Validation

Always validate your HTML.

## Todo

Potential API, for specifying `type` and `relationship`

``` ruby
schema.person(:author).to_hash
schema.person(:author, :link => true).to_hash # default :rel attribute
schema.person(:author, :rel => :citation).to_hash
schema.person(:type => :author).to_hash
```

- If the type doesn't exist in say the microformat, but it does in microdata, then work your way up the tree to find a match.

### Rel Values

acquaintance
alternate
appendix
bookmark
chapter
child
colleague
contact
contents
copyright
co-resident
co-worker
crush
date
friend
glossary
help
kin
license
me
met
muse
neighbor
next
nofollow
parent
prev
previous
section
sibling
spouse
start
stylesheet
subsection
sweetheart
tag
toc
transformation
pronunciation
directory
enclosure
home
payment
accessibility
author
bibliography
cite
group
longdesc
map
member
product
profile
shortlink
status
archive
archives
author
canonical
comment
contribution
EditURI
endorsed
external
fan
feed
icon
kinetic-stylesheet
lightbox
made
meta
microsummary
noreferrer
openid.delegate
openid.server
permalink
pgpkey
pingback
prefetch
publickey
referral
related
replies
resource
search
sidebar 
sponsor
trackback
unendorsed
user
via
wlwmanifest
apple-touch-icon
apple-touch-icon-precomposed
apple-touch-startup-image
canonical
dns-prefetch
openid.delegate
openid.server
openid2.local_id
openid2.provider
p3pv1
pgpkey
prerender
profile
service
shortcut
shortlink
timesheet
widget
wlwmanifest
banner
begin
biblioentry
bibliography
child
citation
collection
definition
disclaimer
editor
end
first
footnote
index
last
navigate
origin
parent
pointer
publisher
sibling
top
trademark
translation
up
urc
pavatar

http://microformats.org/wiki/semantic-html
http://structured-data.org/

---

<cite>MIT License.  &copy; 2011 <a href="http://biglobby.com">Big Lobby LLC</a>. All rights reserved.</cite>