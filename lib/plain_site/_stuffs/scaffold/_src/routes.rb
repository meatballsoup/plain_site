#coding:utf-8



$site.route(
    url_pattern: 'index.html',
    data: {site: $site},
    template: 'index.html',
    build_anyway:true
)

$site.route(
    url_pattern: '404.html',
    data: {site: $site},
    template: '404.html'
)

$site.route(
    url_pattern: 'rss.xml',
    data: { posts: $site.db / '**' },
    template: 'rss.erb'
)


$site.route(
    url_pattern: 'about.html',
    data: {site:$site},
    template: 'about.html'
)




$site.db.subs.each do |cat|
    $site.route(
        url_pattern: "{data_id}.html",
        data: cat / '*' ,
        template: 'post.html'
    )

    pages=cat.posts/10
    pages.each do |p|
        p.category=cat
    end

    $site.route(
        url_pattern: "#{cat.data_id}/{slug}.html",
        data: pages,
        template: 'list.html'
    )
end
