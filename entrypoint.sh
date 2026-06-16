#!/bin/bash
set -e

# マイグレーション実行
bundle exec rails db:migrate

# シード実行
bundle exec rails db:seed

# サーバー起動
exec bundle exec rails s -p 3000 -b 0.0.0.0
