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

#show heading.where(level: 3): it => [
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
        [*HuggingFace:*], [ #link("https://huggingface.co/WHATEVER420")[\@WHATEVER420] ],
        [*GitHub:*],    [ #link("https://github.com/whatever/")[\@whatever] ],
        [*LinkedIn:*],  [ #link("https://www.linkedin.com/in/whatevergg/")[/in/whatevergg] ],
        [*Email:*],     [ #link("mailto:matt@worldshadowgovernment.com")[matt\@worldshadowgovernment.com] ]
      )
    ]
  ]
)

== tl;dr:

AI Hacker and Chaos Engineering Advocate, operating at immense scales with zero
downtime. I have worked for 20 years as a Software Engineer and Software
Engineering Manager, tackling problems in "Big Data" from the get-go. My teams
and I have consistently solved complex problems, owned a ton of infrastructure,
and celebrated the delivery of ambitious projects. Whatever my ikigai is, it
braids Mathematics and Programming; _I'm loving this AI boom_.

#grid(
  columns: (auto, 1fr),
  column-gutter: 1em,
  row-gutter: 0.25em,
  inset: (x: 0.0em, y: 0.3em),
  [ *ML + AI* ], [ #tech[Generative AI], #tech[LLMs], #tech[RAG], #tech[Knowledge Graphs], #tech[pgvector], #tech[LangGraph], #tech[LangSmith], #tech[Fine-tuning], #tech[LoRA] ],
  [ *Engineering + Platform* ], [ #tech[Terraform], #tech[Kubernetes], #tech[MLOps], #tech[Airflow], #tech[Kafka], #tech[Celery], #tech[AWS], #tech[GCP], #tech[Go-lang], #tech[Python] ],
  [ *Achievements* ], [
    - #link("https://huggingface.co/WHATEVER420/script-kiddy")[Fine-tuned Qwen3] for vulnerability scanning and tool usage
    - #link(<sec-oracle>)[Managed Backend and Data Engineering teams] solving challenging technical problems
    - #link(<sec-warmer>)[Launched innovative, agent-based, llm-powered products]
    - #link(<sec-oracle-engineer>)[Architected and deployed massive-scale, real-time data pipelines]: 1M+ records/second
    - #link(<sec-oracle-engineer>)[Maintained infrastructure comprising 1,000+ instances]
    - #link(<sec-freelance>)[Freelanced as a Founding AI Engineer], building ML applications for seed-stage companies
    - #link(<sec-freelance-synthetic>)[Fine-tuned Mixtral and gpt-oss-20b] to build red-team models for synthetic data generation
  ],
  // [ *Education* ], [
  //   Mathematics, Bachelor of Science, Boston University
  // ],
)


== Work Experience

=== #job([Warmer <sec-warmer>], "Founding AI Engineer", "November 2024 - Present")

Building the future of Financial Advisory. In this role, I launched two AI
products from zero to production: a financial advisor assistant and intelligent
client-advisor matching system, optimizing Cost-per-Lead.


- Zero-to-One: founded and scaled AI product from zero to first paying customer -
  #tech[LangGraph], #tech[OpenAI], #tech[Python]
- Built conversational, lead-gen agent, the foundation of the new business model -
  #tech[LangGraph], #tech[LLM]
- Achieved \~0% hallucinations through grounding and post-inference validation techniques -
  #tech[LangGraph], #tech[Python]
- Built and curated LLM evaluation pipelines, golden datasets, & hallucination scoring - catching 99% of issues -
  #tech[LangSmith]
- Architected multi-agent system managing complete client lifecycle, processing 1000+ meetings per day -
  #tech[LangGraph]
- Introduced experiment-driven development culture with A/B testing and feature flags -
  #tech[PostHog]
- Built sub-12 second transcript analysis pipeline for real-time processing -
  #tech[Celery], #tech[Amazon SQS]
- Designed complete agent architecture including RAG, memory, and tool usage systems -
  #tech[pgvector], #tech[RAG], #tech[LangGraph]
- Implemented hybrid-search RAG system across 1,000,000+ client communications -
  #tech[GraphRAG]/#tech[LightRAG], #tech[pgvector]
- Modified open-source dynamic Knowledge Graph, LightRAG, to support pgvector/Postgres backend -
  #tech[pgvector], #tech[Python]



=== #job([Freelance / Stealth Startups <sec-freelance>], "AI Engineer, Hacker", "September 2023 - November 2024")

Freelanced, worked on several projects with early-stage startups, building out AI products.

==== WorkMate Labs: Workmate is your AI teammate
- Designed and built a Digital Assistant, automating task extraction and email drafting - #tech[LLM], #tech[TypeScript]
- Designed and deployed LLM Prompts for contextual, personal email drafting - #tech[ChatGPT], #tech[Gemini], #tech[LLM]
- Designed and deployed custom evaluation framework for measuring LLM performance - #tech[LangSmith], #tech[TypeScript]
- Designed retrieval system for context-aware search of similar sent emails - #tech[Retrieval], #tech[TypeScript]

==== Stealth Startup: FoodTech, translating conversations into API calls
- Fine-tuned Dolphin Mixtral to improve conversational style <sec-freelance-synthetic> - #tech[Mixtral], #tech[HuggingFace], #tech[Python]
- Designed and built question-answering workflows inspired by Graph-of-thoughts - #tech[OpenAI API], #tech[Python]
- Designed and built SMS-based chat interface to LLMs - #tech[AWS Bedrock], #tech[LangChain], #tech[Twilio], #tech[Python]
- Automated MLOps for LLM-based projects - finetuning, testing, deployment, and performance evaluation
- Designed and deployed IaC for all services - #tech[Terraform]

==== Stealth Startup: Generative AI Customers as a service
- Diagnosed and solved a mission-critical problem for scheduling flow of traffic to clients - #tech[Math]!
- Designed and built API to develop, simulate, and actually orchestrate system traffic flows - #tech[Python]
- Standardized ML Ops approach for use with Stable Diffusion and LLMs - #tech[Terraform]
- Designed and built tooling to monitor, compare, and research LLM performance - #tech[Python], #tech[LLM], #tech[LLaMa]

=== #job([Owl.co], "Software Engineer", "January 2023 - September 2023")

Returning to the startup world, I designed and built products, catering to the Insurance Industry, with a focus on integrating Machine Learning with Human tasks. Here my focus was on ML products instead of Data scale.

- Led an interdisciplinary team building ML products, automating tasks performed by human investigators: scraping the web, classifying documents, designing ETLs - #tech[Clojure], #tech[PyTorch], #tech[Presto], #tech[Spark]
- Architected systems to integrate ML inference with human-driven tasks - #tech[Clojure], #tech[AWS Sagemaker]
- Automated hundreds of daily insurance claims investigations with the use of ML, reducing manual investigations by 70%
- Designed and built ETL workflows for analytic databases - #tech[Airflow], #tech[Spark]
- Built dashboards tracking performance of ML models against their human counterparts - #tech[Presto], #tech[Airflow]
- Deployed and maintained infrastructure - #tech[AWS CloudFormation], #tech[AWS SageMaker]
- Mentored mid-level Engineers on Data Engineering

=== #job([Oracle Data Cloud, MOAT <sec-oracle>], "Software Engineering Manager", "December 2019 - October 2021")

I led a highly technical team to create a vast, event-level data store, used as the source-of-truth for the suite of MOAT products. The real-time system processes 1.2M+ records/second, and requires zero downtime. Consequently, I grew a team with high technical aptitude, and emphasized ownership as a core principle in Software Development. <sec-oracle-engineer>

- Managed and grew team of 7 Data Engineers, ranging from College Recruit to Senior Engineer
- Built multiyear Software Roadmap with Engineering Managers and Product Owners
- Mentored and promoted every Software Engineer on my team
- Collaborated with ML Engineers and Data Scientists to release and update models in production code
- Collaborated with outside Engineering and Data Science stakeholders to design a flexible data pipeline
// - Organized and led "Agile" rituals - Sprint Planning, Sprint Review, and Backlog Grooming
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
- Built multiyear roadmap for the data pipeline, and the systems that power it
- Onboarded all new hires to MOAT's data pipeline
- Designed and built stream-processing applications processing 1.2M+ events/second - #tech[Go-lang], #tech[Python], #tech[Kafka]
- Designed and built system-wide wire protocol - #tech[Protobuf]
- Built custom software that reduced instance count by 50%, saving over \$2M dollars - #tech[Go-lang]
- Built and maintained software end-to-end over 1,000+ AWS instances (c5.xl, r5.8xl)
- Designed "cold storage" data schema - #tech[Parquet]
- Maintained historical databases, importing 800,000,000+ rows per day - Highly modified #tech[Postgres]
- Acquired by Oracle Data Cloud

=== #job([Chartbeat], "Tech Lead, Data Engineering", "December 2014 - December 2016")

I led an interdisciplinary team as a product-minded Data Engineer, building both the core data pipeline and an initial version of the Chartbeat Historical product. This position introduced me to large-scale distributed systems, leadership, and implementing product-facing changes.

- Led 7-person interdisciplinary Scrum Team
// - Organized and led "Agile" rituals - Sprint Planning, Sprint Review, and Backlog Grooming
- Designed and built core data pipeline, processing 300,000+ events per second - #tech[Kafka] and #tech[Clojure]
- Designed and maintained session-level data warehouse - #tech[Amazon Redshift]
- Designed and maintained sub-second query databases, importing 1,000,000+ rows per hour - #tech[Postgres]
- Designed wire protocol - #tech[Protobuf]
- Built and maintained real-time data-scrubbing libraries - #tech[Clojure], #tech[Java]
// - Wrote checks, measuring pipeline health and recording instances of data-loss - #tech[Nagios]
- Deployed and configured production machines - #tech[Puppet], #tech[Fabric]