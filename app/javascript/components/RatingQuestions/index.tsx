import * as React from 'react'
import axios from 'axios'
import RatingQuestion from './RatingQuestion'
import * as styles from './index.module.scss'

interface Question {
  title: string
}

interface RatingQuestionsProps {
  apiURL: string
}

interface RatingQuestionsState {
  ratingQuestions: Question[]
}

class RatingQuestions extends React.Component<RatingQuestionsProps, RatingQuestionsState> {
  state = {
    ratingQuestions: []
  }

  componentDidMount() {
    axios.get(this.props.apiURL).then((response) =>
      this.setState({ratingQuestions: response.data})
    )
  }

  render() {
    return(
      <div className={styles.list} data-automation-id='questions-list'>
        {this.state.ratingQuestions.map((question) => <RatingQuestion key={question.id} {...question} />)}
      </div>
    )
  }
}

export default RatingQuestions
