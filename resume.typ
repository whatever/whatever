#set document(
  title: "Matt Owen - Resume",
  author: "Matt Owen",
)

#set page(
  paper: "us-letter",
  margin: (x: 0.75in, y: 0.75in),
)

#set text(
  font: "Montserrat",
  size: 8pt,
  hyphenate: false,
)

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

#let tech(content) = text(
  fill: rgb(33, 33, 33),
  style: "italic",
  [#content]
)

#show heading.where(level: 3): it => [
  #set text(size: 11pt, weight: "bold")
  #it.body
]

#show link: set text(fill: rgb("#0066cc"))



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

#align(left)[
  *GenAI, LLM, MLOps, Data, Math, Kafka, Airflow, Postgres, Kubernetes, Terraform, Python, Golang, joie de vivre*
]

== Highlights

- Managed Backend and Data Engineering teams solving massive-scale data problems
- Built and deployed ML Ops infrastructure for LLM's
- Built roadmaps, planning org-wide architecture and feature development
- Designed and built realtime systems processing 1,000,000+ events/second
- Maintained infrastructure comprising 1,000+ instances
- Freelanced building ML applications for early stage companies

== Work Experience

=== Warmer
*Founding AI Engineer* \
_November 2024 - Present_

Currently Pivoting! Building AI-powered relationship intelligence platform for Financial Advisors, transforming how they nurture client relationships through LLM-driven insights and automation.

- Architected and deployed meeting intelligence system using OpenAI APIs to transcribe, analyze, and extract actionable insights from advisor-client conversations - #tech[Python, OpenAI, Vector DB]
- Built comprehensive RAG database from customer communications, enabling advisors to surface historical context and relationship patterns across all client touchpoints - Pinecone, OpenAI Embeddings, PostgreSQL
- Developed evaluation framework and quality metrics for prompt correctness, implementing automated testing suite that measures factual accuracy and response relevance - Python, Custom Eval Framework
- Designed data sourcing and annotation strategy to ensure LLM outputs are grounded in factuality, reducing hallucinations and building advisor trust - Human-in-the-loop validation, Active Learning
- Created LLM agents with advanced tool usage capabilities, enabling advisors to automate complex workflows through natural language - LangChain, Function Calling, Python
- Built conversational AI system for lead generation, converting unstructured conversations into qualified opportunities - OpenAI, Custom Prompts, State Management
- Developed "relationship health" scoring algorithm combining LLM sentiment analysis with interaction patterns to predict client churn - OpenAI Embeddings, PostgreSQL
- Implemented multi-modal processing pipeline handling audio, transcripts, and documents to build comprehensive client interaction timelines - Whisper, OpenAI, S3
- Pioneered "warmth detection" features using fine-tuned models to coach advisors on relationship-building during client interactions



=== Freelance / Stealth Startups
*Software Engineer, Hacker* \
_September 2023 - November 2024_

Currently freelancing, working on several projects with early-stage startups, building out AI products.

*WorkMate Labs: Workmate is your AI teammate*
- Designed and built a Digital Assistant, automating task extraction and email drafting - #tech[LLM], Python
- Designed and deployed LLM Prompts for contextual, personal email drafting - ChatGPT, Gemini, LLM
- Designed Vector DB for context-aware search of similar sent emails - Pinecone, Google Vector Search
- Designed and deployed custom evaluation framework for measuring LLM performance
- Curated datasets for evaluation and fine-tuning - Python, etc.
- Architected and designed large scale fine-tuning workflows for email drafting - Python

*Stealth Startup: FoodTech, translating conversations into API calls*
- Designed and built SMS-based chat interface to LLM's - AWS Bedrock, LangChain, Twilio, Python
- Designed and built interface from LLM conversations to downstream API's - AWS Bedrock, Python
- Automated MLOps for LLM-based projects - finetuning, testing, deployment, and performance evaluation
- Designed and deployed IaC for all services - Terraform
- Designed and built question-answering workflows inspired by Graph-of-thoughts - OpenAI API, Python
- Fine-tuned Dolphin Mixtral to improve conversational style - Mixtral, HuggingFace, Python

*Stealth Startup: Generative AI as a service*
- Diagnosed and solved a mission-critical problem for scheduling flow of traffic to clients - Math!
- Designed and built API to develop, simulate, and actually orchestrate system traffic flows - Python
- Standardized ML Ops approach for use with Stable Diffusion and LLM's - Terraform
- Designed and built tooling to monitor, compare, and research LLM performance - Python, LLM, LLaMa

*airmax.com: High Performance Frontend + Simple Realtime Web App*
- Automated deployment of static assets, load balancer, and CDN - AWS CloudFront, AWS LB, Terraform
- Designed and built realtime web app to display bids as they come in - #tech[Python], Flask, Websockets
- Honestly, I just thought it'd be cool to help sell airmax.com - Fun!

=== Owl.co
*Software Engineer* \
_New York, New York • January 2023 - September 2023_

Returning to the startup world, I designed and built products, catering to the Insurance Industry, with a focus on integrating Machine Learning with Human tasks. Here my focus was on ML products instead of Data scale.

- Led an interdisciplinary team building ML products, automating tasks performed by human investigators: scraping the web, classifying documents, designing ETL's - Clojure, PyTorch, Presto, Spark
- Architected systems to integrate ML inference with human-driven tasks - Clojure, AWS Sagemaker
- Designed and built ETL workflows for analytic databases - Airflow, Spark
- Built dashboards tracking performance of ML models against their human counterparts - Presto, Airflow
- Mentored mid-level Engineers on Data Engineering
- Deployed and maintained infrastructure - AWS CloudFormation, AWS SageMaker

=== Oracle Data Cloud, MOAT
*Software Engineering Manager* \
_New York, New York • December 2019 - October 2021_

I led a highly technical team to create a vast, event-level data store, used as the source-of-truth for the suite of MOAT products. The real-time system processes 1.2M+ records/second, and requires zero downtime. Consequently, I grew a team with high technical aptitude, and emphasized ownership as a core principle in Software Development.

- Managed and grew team of 7 Data Engineers, ranging from College Recruit to Senior Engineer
- Built multiyear Software Roadmap with Engineering Managers and Product Owners
- Mentored and promoted every Software Engineer on my team
- Collaborated with ML Engineers and Data Scientists to release and update models in production code
- Collaborated with outside Engineering and Data Science stakeholders to design a flexible data pipeline
- Organized and led "Agile" rituals - Sprint Planning, Sprint Review, and Backlog Grooming
- Led project to migrate legacy systems from EC2 to Kubernetes (EKS) - Kubernetes
- Migrated legacy core business logic to modern systems - Kafka, Airflow
- Managed a team owning 800+ instances - AWS
- Managed a budget of \$340,000+ per month
- Authored technical proposals for Data Privacy, System Architecture, and Wire Protocols
- Co-wrote and presented software application proposals, detailing and defending technology decisions
- Reviewed and approved technical design proposals and outage postmortems

=== Oracle Data Cloud, MOAT
*Team Lead, Lead Real-Time Systems Engineer* \
_New York, New York • February 2017 - December 2019_

I stabilized and scaled a massive computing cluster, halved instance count, and saved over \$2M annually. Comprising a massive 30k codebase, the real-time system contained all business logic to power the MOAT dashboard, and required biweekly deployments. Here, I emphasized stability and correctness, deploying frequent changes across 1,000+ instances.

- Managed weekly software releases for core business logic, contributed to by 4 distinct teams
- Contributed and advised on long-term roadmap as an Independent Contributor
- Onboarded all new hires to MOAT's data pipeline
- Designed and built stream-processing applications processing 1.2M+ events/second - Go, Python, Kafka
- Designed and built system-wide wire protocol - Protobuf
- Built custom software that reduced instance count by 50%, saving over \$2M dollars - Go
- Built and maintained software end-to-end over 1,000+ AWS instances (c5.xl, r5.8xl)
- Designed "cold storage" data schema - Parquet
- Maintained historical databases, importing 800,000,000+ rows per day - Highly modified Postgres
- Acquired by Oracle Data Cloud

=== Chartbeat
*Team Lead, Senior Data Engineer* \
_New York, New York • December 2014 - December 2016_

I led an interdisciplinary team as a product-minded Data Engineer, building both the core data pipeline and an initial version of the Chartbeat Historical product. This position introduced me to large-scale distributed systems, leadership, and implementing product-facing changes.

- Led 7-person interdisciplinary Scrum Team
- Organized and led "Agile" rituals - Sprint Planning, Sprint Review, and Backlog Grooming
- Designed and built core data pipeline, processing 300,000+ events per second - Kafka and Clojure
- Designed and maintained session-level data warehouse - Amazon Redshift
- Designed and maintained sub-second query databases, importing 1,000,000+ rows per hour - Postgres
- Designed wire protocol - Protobuf
- Built and maintained real-time data-scrubbing libraries - Clojure, Java
- Wrote checks, measuring pipeline health and recording instances of data-loss - Nagios
- Deployed and configured production machines - Puppet, Fabric