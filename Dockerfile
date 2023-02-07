FROM ruby:2.7

WORKDIR /amy-newland-code-challenge
COPY . /amy-newland-code-challenge

RUN gem install bundler
RUN bundle install

CMD ["ruby", "word_sequence_finder.rb", "moby-dick.txt", "brothers-karamazov.txt"]
