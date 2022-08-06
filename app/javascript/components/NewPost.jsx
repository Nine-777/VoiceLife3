import React from 'react';
import Lesson from './Lesson';
import { Carousel } from 'react-responsive-carousel'
import "react-responsive-carousel/lib/styles/carousel.min.css";

class NewPost extends React.Component {
  render() {
    // const lessonList = [
    //   {
    //     name: 'HTML & CSS',
    //     image: 'https://s3-ap-northeast-1.amazonaws.com/progate/shared/images/lesson/react/html.svg',
    //     introduction: 'WEBページはHTML、CSSという言語によってその見た目が作られています。 実際にWEBページを作りながら学んでみましょう!',
    //   },
    //   {
    //     name: 'Sass',
    //     image: 'https://s3-ap-northeast-1.amazonaws.com/progate/shared/images/lesson/react/sass.svg',
    //     introduction: 'SassはCSSをより便利に効率的にするための言語です。',
    //   },
    //   {
    //     name: 'JavaScript',
    //     image: 'https://s3-ap-northeast-1.amazonaws.com/progate/shared/images/lesson/react/es6.svg',
    //     introduction: 'JavaScriptはフロントエンドだけでなく、サーバーサイドまで広い可能性を持つプログラミング言語です。',
    //   },
    //   {
    //     name: 'React',
    //     image: 'https://s3-ap-northeast-1.amazonaws.com/progate/shared/images/lesson/react/react.svg',
    //     introduction: 'ReactはHTMLのように、サイトの見た目をつくることができるJavaScriptのライブラリです。',
    //   },
    // ];

    return (
      <><div className='tutorial_wrapper'>
        <div className='tutorial_main'>
          <div className='tutorial_container'>
            <h1>新規投稿してみよう！</h1>
            <h2>VoiceLifeへようこそ!</h2>
          </div>
          {/* <div className='tutorial_container'>
      <h3></h3>
      {lessonList.map((lessonItem) => {
        return (
          <Lesson
            name={lessonItem.name}
            image={lessonItem.image}
            introduction={lessonItem.introduction}
          />
        );
      })}
    </div> */}
        </div>
      </div><>
      <Carousel>
        <div>
          <img src="assets/1.jpeg" />
          <p className="legend">Legend 1</p>
        </div>
        <div>
          <img src="assets/2.jpeg" />
          <p className="legend">Legend 2</p>
        </div>
        <div>
          <img src="assets/3.jpeg" />
          <p className="legend">Legend 3</p>
        </div>
      </Carousel>
        </></>
    );
  }
}

export default NewPost;
