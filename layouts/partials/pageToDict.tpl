{{- $categoryPages := .GetTerms "categories" -}}
{{- $categories := slice -}}
{{- range $categoryPages -}}
{{-     $categories = $categories | append .Title -}}
{{- end -}}

{{- $tagPages := .GetTerms "tags" -}}
{{- $tags := slice -}}
{{- range $tagPages -}}
{{-     $tags = $tags | append .Title -}}
{{- end -}}

{{- $alternates := slice -}}
{{- if .Params.alternates -}}
{{-     $alternates = .Params.alternates -}}
{{- end -}}

{{- $images := slice -}}
{{- if .Params.images -}}
{{-     $images = .Params.images -}}
{{- end -}}

{{- $entry := dict
    "slug" .Slug
    "link" .RelPermalink 
    "date" .Date
    "title" .Title
    "summary" (.Summary | plainify)
    "content" .Content
    "plain" .Plain
    "contentWordCount" .WordCount
    "contentReadingTime" .ReadingTime
    "tableOfContents" .TableOfContents
    "categories" $categories
    "alternates" $alternates
    "images" $images
    "tags" $tags
    "kind" .Kind
    "section" .Section
    "type" .Type
    -}}
{{- with .File -}}
{{-     $entry = merge $entry (dict "contentSourceFile" .Path) -}}
{{- end -}}
{{- return $entry -}}
