# AppSimulation
![language](https://img.shields.io/badge/language-rails-coral.svg)
![version](https://img.shields.io/badge/version-0.0.1-green.svg)
![e-mail](https://img.shields.io/badge/email-taiyou88@naver.com-blue.svg)

## Ruby Version
* ruby 2.3.1
* Rails >= 4.2.6

## 설정
git repository를 fork 또는 clone
```
git clone https://github.com/nanoblock/app_simulation.git
```
Gem Install
```
cd app_simulation
bundle install
```
Run
```
bundle exec rails s
```

## Database
### Database create & initialization
```
rake db:create db:migrate
```
### Tables
#### Image table
* 저장된 이미지의 절대 경로를 저장한다.
```
string: xml_path
timestamps:   created_at
timestamps:   updated_at
```

#### Photo table
* Image Table의 자식 table으로, Image의 세부사항을 저장한다.
```
string      :name
string      :photo_file_name
string      :photo_content_type
string      :photo_file_size
string      :url
timestamps  :created_at
timestamps  :updated_at
```

#### Ocr table
* Ocr Table은 OCR된 결과값을 저장한다.
```
string      :text
string      :top
string      :left
string      :width
string      :height
timestamps  :created_at
timestamps  :updated_at
```
#### Clickable table
* Clickable Table은 사용자가 선택한 Click할수 있는 영역의 세부사항과 연결할 Image의 정보를 저장한다.
```
string      :target_image_id
string      :top
string      :left
string      :width
string      :height
timestamps  :created_at
timestamps  :updated_at
```

## Photo Config
### Image 사이즈
* original  -> 400x650
* medium    -> 300x300
* thumb     -> 120x180

### 지원 가능 이미지 파일 Extension
* image/jpg
* image/jpeg
* image/png

## System Dependencies
* postgresql
* imagemagick
