FROM ruby:3.2

# Node.jsとYarnをインストール
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - \
  && apt-get update -qq \
  && apt-get install -y nodejs yarn postgresql-client

WORKDIR /app

# Gemfile & Gemfile.lock を先にコピーして bundle install
COPY Gemfile* ./
RUN bundle install

# その後、すべてのアプリコードをコピー
COPY . .

# binstubs がない場合に備えて生成（Dockerfile内で対応するなら）
RUN bundle exec rake app:update:bin

# 開発用コマンド
CMD ["bash"]
