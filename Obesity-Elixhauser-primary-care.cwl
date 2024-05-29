cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  obesity-elixhauser-primary-care-monitoring---primary:
    run: obesity-elixhauser-primary-care-monitoring---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  obesity-elixhauser-primary-care---primary:
    run: obesity-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: obesity-elixhauser-primary-care-monitoring---primary/output
  obesity-elixhauser-primary-care-treatment---primary:
    run: obesity-elixhauser-primary-care-treatment---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: obesity-elixhauser-primary-care---primary/output
  obesity---primary:
    run: obesity---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: obesity-elixhauser-primary-care-treatment---primary/output
  obesity-elixhauser-primary-care-index---primary:
    run: obesity-elixhauser-primary-care-index---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: obesity---primary/output
  obesity-elixhauser-primary-care-indicator---primary:
    run: obesity-elixhauser-primary-care-indicator---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: obesity-elixhauser-primary-care-index---primary/output
  dietary-obesity-elixhauser-primary-care---primary:
    run: dietary-obesity-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: obesity-elixhauser-primary-care-indicator---primary/output
  obesity-elixhauser-primary-care-health---primary:
    run: obesity-elixhauser-primary-care-health---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: dietary-obesity-elixhauser-primary-care---primary/output
  overweight-obesity-elixhauser-primary-care---primary:
    run: overweight-obesity-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: obesity-elixhauser-primary-care-health---primary/output
  other-obesity-elixhauser-primary-care---primary:
    run: other-obesity-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: overweight-obesity-elixhauser-primary-care---primary/output
  obesity-elixhauser-primary-care-letter---primary:
    run: obesity-elixhauser-primary-care-letter---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: other-obesity-elixhauser-primary-care---primary/output
  obesity-elixhauser-primary-care-hyperalimentation---primary:
    run: obesity-elixhauser-primary-care-hyperalimentation---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: obesity-elixhauser-primary-care-letter---primary/output
  obesity-elixhauser-primary-care-hypoventilation---primary:
    run: obesity-elixhauser-primary-care-hypoventilation---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: obesity-elixhauser-primary-care-hyperalimentation---primary/output
  obesity-elixhauser-primary-care-assessment---primary:
    run: obesity-elixhauser-primary-care-assessment---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: obesity-elixhauser-primary-care-hypoventilation---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: obesity-elixhauser-primary-care-assessment---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
