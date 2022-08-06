import React, { useState } from 'react';
import { Carousel } from 'react-responsive-carousel';
import "react-responsive-carousel/lib/styles/carousel.min.css";

class NewPost extends React.Component {
  constructor(props) {
    super(props);
    this.state = {Step: false};
  }

  handleClickLesson() {
    this.setState({Step: true});
  }

  handleClickClose() {
    this.setState({Step: false});
  }

  render() {
    return (
      <Carousel>
      <div>
        <p>投稿してみよう！</p>
        <img src="/new_post.png" />
      </div>
      <div>
        <p>投稿を見てみよう！</p>
        <img src="assets/2.jpeg" />
      </div>
      <div>
        <p className="legend"></p>
        <img src="assets/3.jpeg" />
      </div>
    </Carousel>
    );
  }
}

export default NewPost;
