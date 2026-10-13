#set document(
  title: "RESUMÉ",
  author: "Matt Owen",
  keywords: ("manager", "hacker", "ai", "fine-tuning", "llm", "rag"),
  date: datetime.today(),
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

#set par(linebreaks: "optimized")

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
  columns: (30%, 1fr, auto),
  column-gutter: 1em,
  [#company],
  [#text(size: 0.8em, weight: "bold")[#align(left)[#title]]],
  [#text(size: 0.7em, weight: "medium", style: "italic")[#align(right)[#date]]],
)

#let tech(content) = {
  let text-str = repr(content)
  let prime = 2147483647
  let hash = 2166136261

  for c in text-str.clusters() {
    hash = calc.rem(hash * 31 + str.to-unicode(c), prime)
  }

  let mixed = calc.rem(hash * 2654435761, prime)
  let hue = calc.rem(mixed, 24) * 15
  let saturation = (42, 52, 62).at(calc.rem(calc.div-euclid(mixed, 24), 3))
  let lightness = (89, 93).at(calc.rem(calc.div-euclid(mixed, 72), 2))
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

#let stack(..items) = pad(bottom: 0.3em)[
  #text(weight: "bold")[Stack:] #items.pos().map(t => tech(t)).join(", ")
]

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
      New York, NY \
  ],
  [
    #align(left)[
      #table(
        columns: (auto, auto),
        stroke: none,
        inset: (x: 6pt, y: 3pt),
        [*GitHub:*],    [ #link("https://github.com/whatever/")[\@whatever] ],
        [*HuggingFace:*], [ #link("https://huggingface.co/pool-water")[\@pool-water] ],
        [*LinkedIn:*],  [ #link("https://www.linkedin.com/in/whatevergg/")[/in/whatevergg] ],
        [*Email:*],     [ #link("mailto:matt@worldshadowgovernment.com")[matt\@worldshadowgovernment.com] ]
      )
    ]
  ]
)

== tl;dr

ML Engineering Manager and AI Hacker, solving the hardest problems by delivering bleeding-edge research into production.
I have worked for 20+ years as a Researcher, Engineer, and Manager, tackling problems at every level: real-time scale,
frontier innovation, and shipping usable products. My teams and I have consistently solved complex problems, owned a ton
of infrastructure, and celebrated the delivery of ambitious projects.

#grid(
  columns: (auto, 1fr),
  column-gutter: 1em,
  row-gutter: 0.25em,
  inset: (x: 0.0em, y: 0.3em),
  // the achievements list indents its text by the bullet marker's width, so the
  // other rows get matching padding to line their text up with it
  [ *ML + AI* ], [ #pad(left: 0.75em)[ #tech[LLMs], #tech[Generative AI], #tech[AI Agents], #tech[RAG], #tech[MCP], #tech[Fine-tuning], #tech[PyTorch], #tech[vLLM], #tech[Evals], #tech[Knowledge Graphs] ] ],
  [ *Engineering + Platform* ], [ #pad(left: 0.75em)[ #tech[Terraform], #tech[Kubernetes], #tech[MLOps], #tech[Airflow], #tech[Kafka], #tech[Celery], #tech[AWS], #tech[Spark], #tech[Golang], #tech[Python] ] ],
  [ *Achievements* ], [
    #set list(indent: 0em, body-indent: 0.4em)
    - #link("https://github.com/Lazarus-AI/clearwing")[Released Clearwing and AGEST Zero Shield], an agentic SOC and pentesting suite
    - #link("https://www.economist.com/briefing/2026/06/25/ai-models-values-are-very-different-from-most-peoples")[Curated data collection and evaluation of unaligned models] - covered in The Economist
    - #link("https://huggingface.co/pool-water/script-kiddie")[Fine-tuned Qwen3] for red-team use in 2025, before commodity cyber-specialized LLMs existed
    - #link(<sec-oracle>)[Built company-wide data pipeline and lake], unifying Research, Product, and Engineering
    - #link(<sec-oracle-engineer>)[Architected and deployed massive-scale, real-time data pipelines]: 1.2M+ records/second
    - #link(<sec-oracle-engineer>)[Maintained infrastructure comprising 1,000+ instances]
  ],
  [ *Education* ], [ #pad(left: 0.75em)[ Bachelor of Science, Mathematics - Boston University ] ],
)


== Work Experience

=== #job([Lazarus AI <sec-lazarus>], "ML Engineering Manager", "October 2025 - Present")

#link("https://www.lazarusaie.com/research")[Leading ML engineering and applied research] across a broad portfolio: Cybersecurity, Public-Sector, Insurance.
Here, my work has been delivering the latest AI technology into effective, comprehensible products for a wide range of contracts.

#stack[LangGraph][RAG][OCR][RLM][vLLM][Dagster][Langfuse][Axolotl][LLaMa-Factory][Python][Terraform][Kubernetes][MLOps]

- Managed 3 concurrent project lines: #link("https://github.com/Lazarus-AI/clearwing")[Clearwing] (Agentic SOC + Pentesting), #link("https://www.lazarusaie.com/platform")[AIE] (Document Extraction), ATLS (Public Sector)
- Managed 4-person team, translating research into product tech stacks
- Built model-agnostic Agentic Systems across 4 projects, replacing legacy document extraction
- Extended document-parsing capability to 1,000+ pages at 1/10 per-page cost
- Migrated clients from cloud-hosted SaaS solutions to sovereignly-owned, on-prem solutions
- Synthesized and cataloged training data for the ReAligned/UnCut series of Lazarus Models
- Built LLM observability stack to run fully on-prem under HIPAA and SOC 2 constraints
- Drove evaluation-driven engineering culture, improving document extraction correctness from 20% to 85%
- Fine-tuned and deployed open-weight models on self-hosted inference infrastructure
- Built features for Clearwing, replicating 80% of project #link("https://www.anthropic.com/glasswing")[Glasswing's findings] with open-weight models
- Owned data collection and evaluation for #link("https://huggingface.co/Lazarus-Ai/models")[ReAligned], finetunes eliminating propaganda; covered in #link("https://www.economist.com/briefing/2026/06/25/ai-models-values-are-very-different-from-most-peoples")[The Economist]
- Owned production ML platform: k3s cluster, ArgoCD, Dagster pipelines

=== #job([Warmer <sec-warmer>], "Founding AI Engineer", "November 2024 - October 2025")

Building the future of Financial Advisory. In this role, I launched two AI
products from zero to production: a financial advisor assistant and intelligent
client-advisor matching system, optimizing Cost-per-Lead.

#stack[LangGraph][OpenAI][Python][LLM][LangSmith][PostHog][Celery][Amazon SQS][pgvector][RAG][GraphRAG][LightRAG]

- Zero-to-One: founded and scaled AI product from zero to first paying customer
- Built conversational, lead-gen agent, the foundation of the new business model
- Achieved \<1% hallucinations on golden-set evals through grounding and post-inference validation
- Architected multi-agent system managing complete client lifecycle, processing 1000+ meetings per day
- Introduced experiment-driven development culture with A/B testing and feature flags
- Built sub-12 second transcript analysis pipeline for real-time processing
- Designed complete agent architecture including RAG, memory, and tool usage systems
- Implemented hybrid-search RAG system across 1,000,000+ client communications
- Modified open-source dynamic Knowledge Graph, LightRAG, to support pgvector/Postgres backend



=== #job([AI Consulting <sec-freelance>], "AI Consultant and Contractor", "September 2023 - November 2024")

Contracted with several early-stage startups, building out AI products.

#stack[LLM][TypeScript][LangSmith][Retrieval][Mixtral][HuggingFace][Python][LangChain][Twilio][Terraform]
==== WorkMate Labs: Workmate is your AI teammate

- Designed and built a Digital Assistant, automating task extraction and email drafting
- Designed and deployed custom evaluation framework for measuring LLM performance
- Designed retrieval system for context-aware search of similar sent emails

==== Stealth Startup: FoodTech, translating conversations into API calls

- Fine-tuned Dolphin Mixtral to improve conversational style <sec-freelance-synthetic>
- Designed and built question-answering workflows inspired by Graph-of-thoughts
- Automated MLOps for LLM-based projects - finetuning, testing, deployment, and performance evaluation

==== Stealth Startup: Generative AI Customers as a service

- Diagnosed and solved a mission-critical problem for scheduling flow of traffic to clients
- Designed and built API to develop, simulate, and actually orchestrate system traffic flows
- Standardized MLOps approach for use with Stable Diffusion and LLMs
- Designed and built tooling to monitor, compare, and research LLM performance

=== #job([Owl.co], "Software Engineer", "January 2023 - September 2023")

Designed and built products for insurance tech, focusing on integrating ML into human workflows.

// Returning to the startup world, I designed and built products, catering to the Insurance Industry, with a focus on integrating Machine Learning with Human tasks. Here my focus was on ML products instead of Data scale.

#stack[Clojure][PyTorch][Presto][Spark][Amazon SageMaker][Airflow][AWS CloudFormation]

- Led an interdisciplinary team building ML products, automating tasks performed by human investigators: scraping the web, classifying documents, designing ETLs
- Automated hundreds of daily insurance claims investigations with the use of ML, reducing manual investigations by 70%
- Architected systems to integrate ML inference with human-driven tasks
- Designed and built ETL workflows for analytic databases
- Mentored mid-level Engineers on Data Engineering

#v(0.4em)
#block(fill: rgb("#AAAAAA"), width: 100%, inset: (x: 0.5em, y: 0.4em))[
  #text(size: 11pt, weight: "bold", fill: white)[#grid(
    columns: (30%, 1fr, auto),
    column-gutter: 1em,
    [_Sabbatical_],
    [#text(size: 0.7em, weight: "medium", style: "italic")[_Travel, Meditation, Muay Thai_]],
    [#text(size: 0.7em, weight: "medium", style: "italic")[#align(right)[October 2021 – January 2023]]],
  )]
]

=== #job([Oracle Data Cloud, MOAT <sec-oracle>], "Software Engineering Manager", "February 2017 - October 2021")

I led a highly technical team to create a vast, event-level data store, used as the source-of-truth for the suite of MOAT products.
The real-time system processes 1.2M+ records/second, and requires zero downtime. Consequently, I grew a team with high technical aptitude,
and emphasized ownership as a core principle in Software Development. Acquired by Oracle.

#stack[Kafka][Airflow][Parquet][Golang][Python][AWS][Protobuf][Postgres]

==== Engineering Manager

- Managed and grew team of 7 Data Engineers, ranging from College Recruit to Senior Engineer
- Designed, built, and maintained infra end-to-end: web ingest, stream-processing, hourly ETL to Parquet
- Built multiyear Software Roadmap with Engineering Managers and Product Owners
- Designed and built the event-level data lake, unifying Research, Product, and Engineering datasets
- Managed a team owning 1,000+ instances with a budget of \$340,000+ per month
- Collaborated with ML and Engineering to design a pipeline powering 5 distinct teams
- Mentored and promoted every Software Engineer on my team
// - Authored technical proposals for Data Privacy, System Architecture, and Wire Protocols


==== Technical Lead <sec-oracle-engineer>

- Managed weekly software releases for core business logic, contributed to by 4 distinct teams
// - Built multiyear roadmap for the data pipeline, and the systems that power it
- Designed and built stream-processing applications processing 1.2M+ events/second
- Designed and built system-wide wire protocol
- Built custom software that reduced instance count by 50%, saving over \$2M
// - Built and maintained software end-to-end over 1,000+ AWS instances (c5.xl, r5.8xl)
// - Designed "cold storage" data schema
- Maintained historical databases, importing 800,000,000+ rows per day - Highly modified #tech[Postgres]

=== #job([Chartbeat <sec-chartbeat>], "Tech Lead, Data Engineering", "December 2014 - December 2016")

- Led 8-person interdisciplinary team
- Designed core data pipeline, processing 300,000+ events/second - #tech[Kafka], #tech[Clojure]
- Designed and built the first version of the Chartbeat Historical product, ranking millions of articles - #tech[Postgres]

//=== #job([Chartbeat], "Tech Lead, Data Engineering", "December 2014 - December 2016")
//
//I led an interdisciplinary team as a product-minded Data Engineer, building both the core data pipeline and an initial version of the Chartbeat Historical product. This position introduced me to large-scale distributed systems, leadership, and implementing product-facing changes.
//
//- Led 8-person interdisciplinary Scrum Team
//// - Organized and led "Agile" rituals - Sprint Planning, Sprint Review, and Backlog Grooming
//- Designed and built core data pipeline, processing 300,000+ events per second - #tech[Kafka] and #tech[Clojure]
//- Designed and maintained session-level data warehouse - #tech[Amazon Redshift]
//- Designed and maintained sub-second query databases, importing 1,000,000+ rows per hour - #tech[Postgres]
//- Designed wire protocol - #tech[Protobuf]
//- Built and maintained real-time data-scrubbing libraries - #tech[Clojure], #tech[Java]
//// - Wrote checks, measuring pipeline health and recording instances of data-loss - #tech[Nagios]
//- Deployed and configured production machines - #tech[Puppet], #tech[Fabric]
//
//=== #job([Harvard University, IQSS <sec-research>], "Statistical Programmer, Software Maintainer", "May 2010 - July 2013")
//
//Statistical software and data privacy research at Harvard's Institute for
//Quantitative Social Science. Where I learned to turn research ideas into
//production, open-source code.
//
//- Developed and maintained #link("https://zelig.hsites.harvard.edu")[Zelig], an open-source statistical package unifying model interfaces - #tech[R]
//- Contributed statistical analysis software to #link("https://dataverse.harvard.edu")[Dataverse], open-source infrastructure for research data sharing, preservation, and citation - #tech[Java], #tech[R]
//- Built the Zelig extension to the Dataverse network - #tech[Java]
//- Taught statistical programming workshops - beginner through developing statistical packages
//
// === #job([New England Complex Systems Institute], "Research Assistant", "2005 - 2008")
//
// Applied Mathematics and complex systems research - the foundation of everything since.
//
// - Developed simulations and mathematical models - #tech[Python]
// - Assisted lecturers for course in Simulation and Mathematical Modeling
// - Built the software substrate for research projects: web applications and MediaWiki extensions - #tech[LAMP], #tech[PHP]

#v(0.4em)
#block(fill: rgb("#AAAAAA"), width: 100%, inset: (x: 0.5em, y: 0.4em))[
  #text(size: 11pt, weight: "bold", fill: white)[#grid(
    columns: (30%, 1fr, auto),
    column-gutter: 1em,
    [_Prior Research_],
    [#text(size: 0.7em, weight: "medium", style: "italic")[Harvard IQSS, NECSI]],
    [#text(size: 0.7em, weight: "medium", style: "italic")[#align(right)[2005 – 2014]]],
  )]
]
