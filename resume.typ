#set page(
  paper: "us-letter",
  margin: (x: 0.75in, y: 0.75in),
)

#set text(
  font: "Montserrat",
  size: 8pt,
  hyphenate: false,
)

#show link: set text(fill: black)

#show heading.where(level: 1): it => [
  #set align(center)
  #set text(size: 18pt, weight: "bold")
  #it.body
]

#show heading.where(level: 2): it => [
  #set text(size: 12pt, weight: "bold")
  #pad(top: 0.5em, bottom: 0.3em)[#it.body]
  #v(-0.9em)
  #line(length: 100%, stroke: 0.5pt)
  #v(0.3em)
]

#let job(company, title, date) = grid(
  columns: (40%, 1fr, 30%),
  column-gutter: 1em,
  [#company],
  [#text(size: 0.7em, weight: "bold")[#align(left)[#title]]],
  [#text(size: 0.7em, weight: "medium", style: "italic")[#align(right)[#date]]],
)

#let tech(content) = {
  // Convert content to string and generate hash
  let text-str = repr(content)
  let hash = 0
  
  // Simple hash function
  for i in range(text-str.len()) {
    hash = calc.rem(hash * 31 + i * 17, 1000000)
  }
  
  // Generate color from hash - using muted colors
  let hue = calc.rem(hash, 360)
  let saturation = 40 + calc.rem(hash, 20)  // 15-35% for muted colors
  let lightness = 93  // 85-95% for light backgrounds

  let bg-color = color.hsl(hue * 1deg, saturation * 1%, lightness * 1%)

  box(
    fill: bg-color,
    inset: (x: 0pt, y: 0pt),
    radius: 0pt,
    text(
      content
    )
  )
}

#show heading.where(level: 3): it => [
  #set text(size: 11pt, weight: "bold")
  #it.body
]

#show link: set text(fill: rgb(79, 56, 255))

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1em,
  [
    #text(size: 18pt, weight: "bold")[Matt Owen] \
      #link("https://RAZORBLA.DE")[https://RAZORBLA.DE] \
  ],
  [
    #align(left)[
      #table(
        columns: (auto, auto),
        stroke: none,
        inset: (x: 6pt, y: 3pt),
        [*GitHub:*],    [ #link("https://github.com/whatever/")[\@whatever] ],
        [*LinkedIn:*],  [ #link("https://www.linkedin.com/in/whatevergg/")[\@whatevergg] ],
        [*Email:*],     [ #link("mailto:matt@worldshadowgovernment.com")[matt\@worldshadowgovernment.com] ]
      )
    ]
  ]
)

== tl;dr:

#grid(
  columns: (auto, 1fr),
  column-gutter: 1em,
  rows: (auto, auto, auto, auto),
  row-gutter: 0.5em,
  [ *ML + AI* ], [ Geneative AI, LLM's, Pinecone, pgvector, OpenAI, LangGraph, LangSmith, Python ],
  [ *Platform* ], [ Terraform, Kubernetes, Airflow, Kafka, Celery, AWS, GCP ],
)

- #link(<sec-oracle>)[Managed Backend and Data Engineering teams] solving challenging technical problems
- #link(<sec-warmer>)[Launched innovative, agent-based, llm-powered products]
- #link(<sec-oracle-engineer>)[Architected and deployed massive-scale, real-time data pipelines]: 1M+ records/second
- #link(<sec-oracle-engineer>)[Maintained infrastructure comprising 1,000+ instances]
- #link(<sec-freelance>)[Freelanced as a Founding AI Engineer], building ML applications for seed-stage companies

== Work Experience

=== #job([Warmer <sec-warmer>], "Founding AI Engineer", "November 2024 - Present")

Currently Pivoting! Building AI-powered relationship intelligence platform for Financial Advisors, transforming how they nurture client relationships through LLM-driven insights and automation.

//  TODO:
// - Insight generation
//   -
// - Transcription:
//   - Soft realtime ETL
//   - Deployed infrastructure as code
// - Brought hallucinations to zero
// - Monitored LLM performance in realtime
// - Prompt engieered
// - Introduced multi-arm bandit testing
// - Introduced POSTHOG for analytics and cohort analysis

- Dropped hallucinations to zero using grounding and post-inference validation - #tech[LangGraph], #tech[Python]
- Built 10+ tools for LLM agents using OpenAI function calling: schema validation with Pydantic, automatic retry logic, state management, and error handling - enabling agents to reliably execute complex multi-step workflows - #tech[LangGraph], #tech[OpenAI]
- Developed evaluation pipeline with custom scoring functions for LLM's - #tech[LangSmith]
- Curated golden set for a slew of tasks: sourcing, transcription, speaker identification, etc. - #tech[LangSmith]
- Developed evaluation framework and quality metrics for prompt correctness, implementing automated testing suite that measures factual accuracy and response relevance - #tech[Python], #tech[Custom Eval Framework]
- Researched quantitative measures of advisor-client relationship health - #tech[Math]
- Architected and deployed agentic workflows for advisor-client interactions - #tech[LangGraph]
- Built a RAG system using contexual retrieval and hybrid-search system to power searches, enabling advisors to surface historical context and relationship patterns across all client touchpoints - #tech[pgvector], #tech[OpenAI Embeddings], #tech[Python]
- Designed, built, and maintained a simple soft real-time event processing pipeline - #tech[Celery], #tech[Amazon SQS]
- Created LLM agents with advanced tool usage capabilities, enabling advisors to automate complex workflows through natural language - #tech[LangChain], #tech[Function Calling], #tech[Python]
- Built conversational AI system for lead generation, converting unstructured conversations into qualified opportunities - #tech[OpenAI], #tech[Custom Prompts], #tech[State Management]


=== #job([Freelance / Stealth Startups <sec-freelance>], "AI Engineer, Hacker", "September 2023 - November 2024")

Currently freelancing, working on several projects with early-stage startups, building out AI products.

*WorkMate Labs: Workmate is your AI teammate*
- Designed and built a Digital Assistant, automating task extraction and email drafting - #tech[LLM], #tech[Python]
- Designed and deployed LLM Prompts for contextual, personal email drafting - #tech[ChatGPT], #tech[Gemini], #tech[LLM]
- Designed Vector DB for context-aware search of similar sent emails - #tech[Pinecone], #tech[Google Vector Search]
- Designed and deployed custom evaluation framework for measuring LLM performance - #tech[Python]
- Curated datasets for evaluation and fine-tuning - #tech[Python]
- Architected and designed large scale fine-tuning workflows for email drafting - #tech[Python]

*Stealth Startup: FoodTech, translating conversations into API calls*
- Designed and built SMS-based chat interface to LLM's - #tech[AWS Bedrock], #tech[LangChain], #tech[Twilio], #tech[Python]
- Designed and built interface from LLM conversations to downstream API's - #tech[AWS Bedrock], #tech[Python]
- Automated MLOps for LLM-based projects - finetuning, testing, deployment, and performance evaluation
- Designed and deployed IaC for all services - #tech[Terraform]
- Designed and built question-answering workflows inspired by Graph-of-thoughts - #tech[OpenAI API], #tech[Python]
- Fine-tuned Dolphin Mixtral to improve conversational style - #tech[Mixtral], #tech[HuggingFace], #tech[Python]

*Stealth Startup: Generative AI as a service*
- Diagnosed and solved a mission-critical problem for scheduling flow of traffic to clients - #tech[Math]!
- Designed and built API to develop, simulate, and actually orchestrate system traffic flows - #tech[Python]
- Standardized ML Ops approach for use with Stable Diffusion and LLM's - #tech[Terraform]
- Designed and built tooling to monitor, compare, and research LLM performance - #tech[Python], #tech[LLM], #tech[LLaMa]

=== #job([Owl.co], "Software Engineer", "January 2023 - September 2023")

Returning to the startup world, I designed and built products, catering to the Insurance Industry, with a focus on integrating Machine Learning with Human tasks. Here my focus was on ML products instead of Data scale.

- Led an interdisciplinary team building ML products, automating tasks performed by human investigators: scraping the web, classifying documents, designing ETL's - #tech[Clojure], #tech[PyTorch], #tech[Presto], #tech[Spark]
- Architected systems to integrate ML inference with human-driven tasks - #tech[Clojure], #tech[AWS Sagemaker]
- Designed and built ETL workflows for analytic databases - #tech[Airflow], #tech[Spark]
- Built dashboards tracking performance of ML models against their human counterparts - #tech[Presto], #tech[Airflow]
- Mentored mid-level Engineers on Data Engineering
- Deployed and maintained infrastructure - #tech[AWS CloudFormation], #tech[AWS SageMaker]

=== #job([Oracle Data Cloud, MOAT <sec-oracle>], "Software Engineering Manager", "December 2019 - October 2021")

I led a highly technical team to create a vast, event-level data store, used as the source-of-truth for the suite of MOAT products. The real-time system processes 1.2M+ records/second, and requires zero downtime. Consequently, I grew a team with high technical aptitude, and emphasized ownership as a core principle in Software Development. <sec-oracle-engineer>

- Managed and grew team of 7 Data Engineers, ranging from College Recruit to Senior Engineer
- Built multiyear Software Roadmap with Engineering Managers and Product Owners
- Mentored and promoted every Software Engineer on my team
- Collaborated with ML Engineers and Data Scientists to release and update models in production code
- Collaborated with outside Engineering and Data Science stakeholders to design a flexible data pipeline
- Organized and led "Agile" rituals - Sprint Planning, Sprint Review, and Backlog Grooming
- Led project to migrate legacy systems from EC2 to Kubernetes (EKS) - #tech[Kubernetes]
- Migrated legacy core business logic to modern systems - #tech[Kafka], #tech[Airflow]
- Managed a team owning 800+ instances - #tech[AWS]
- Managed a budget of \$340,000+ per month
- Authored technical proposals for Data Privacy, System Architecture, and Wire Protocols
- Co-wrote and presented software application proposals, detailing and defending technology decisions
- Reviewed and approved technical design proposals and outage postmortems

=== #job([Oracle Data Cloud, MOAT <sec-oracle-eng>], "Tech Lead, Data Engineering", "February 2017 - December 2019")

I stabilized and scaled a massive computing cluster, halved instance count, and saved over \$2M annually. Comprising a massive 30k codebase, the real-time system contained all business logic to power the MOAT dashboard, and required biweekly deployments. Here, I emphasized stability and correctness, deploying frequent changes across 1,000+ instances.

- Managed weekly software releases for core business logic, contributed to by 4 distinct teams
- Contributed and advised on long-term roadmap as an Independent Contributor
- Onboarded all new hires to MOAT's data pipeline
- Designed and built stream-processing applications processing 1.2M+ events/second - #tech[Go], #tech[Python], #tech[Kafka]
- Designed and built system-wide wire protocol - #tech[Protobuf]
- Built custom software that reduced instance count by 50%, saving over \$2M dollars - #tech[Go]
- Built and maintained software end-to-end over 1,000+ AWS instances (c5.xl, r5.8xl)
- Designed "cold storage" data schema - #tech[Parquet]
- Maintained historical databases, importing 800,000,000+ rows per day - Highly modified #tech[Postgres]
- Acquired by Oracle Data Cloud

=== #job([Chartbeat], "Tech Lead, Data Engineering", "December 2014 - December 2016")

I led an interdisciplinary team as a product-minded Data Engineer, building both the core data pipeline and an initial version of the Chartbeat Historical product. This position introduced me to large-scale distributed systems, leadership, and implementing product-facing changes.

- Led 7-person interdisciplinary Scrum Team
- Organized and led "Agile" rituals - Sprint Planning, Sprint Review, and Backlog Grooming
- Designed and built core data pipeline, processing 300,000+ events per second - #tech[Kafka] and #tech[Clojure]
- Designed and maintained session-level data warehouse - #tech[Amazon Redshift]
- Designed and maintained sub-second query databases, importing 1,000,000+ rows per hour - #tech[Postgres]
- Designed wire protocol - #tech[Protobuf]
- Built and maintained real-time data-scrubbing libraries - #tech[Clojure], #tech[Java]
- Wrote checks, measuring pipeline health and recording instances of data-loss - #tech[Nagios]
- Deployed and configured production machines - #tech[Puppet], #tech[Fabric]