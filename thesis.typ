#import "/layout/thesis_template.typ": *
#import "/metadata.typ": *

#set document(title: title, author: author)

#show: thesis.with(
  title: title,
  titleFrench: titleFrench,
  degree: degree,
  program: program,
  specialization: specialization,
  supervisor: supervisor,
  author: author,
  startDate: startDate,
  submissionDate: submissionDate,
  presentationDate: presentationDate,
  abstract_en: include "/content/abstract_en.typ",
  acknowledgement_content: include "/content/acknowledgement.typ",
  abstract_fr: include "/content/abstract_fr.typ",
)

#include "/content/introduction.typ"
#include "/content/background.typ"
#include "/content/related_work.typ"
#include "/content/requirements_analysis.typ"
#include "/content/system_design.typ"
#include "/content/evaluation.typ"
#include "/content/summary.typ"
