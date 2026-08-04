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

  // Fold into a large prime modulus. `calc` has no bitwise ops, so the
  // avalanche comes from multiplying by a Knuth-style constant and reducing
  // mod a Mersenne prime - the plain `hash * 31` fold left adjacent inputs in
  // adjacent buckets, which is what collapsed the palette.
  let prime = 2147483647
  let hash = 2166136261
  for c in text-str.clusters() {
    hash = calc.rem(hash * 31 + str.to-unicode(c), prime)
  }
  let mixed = calc.rem(hash * 2654435761, prime)

  // Quantize to widely-spaced buckets. With ~60 tags over a free 360deg the
  // mean gap is under 6deg, so near-misses read as "almost the same tech" -
  // a false signal. Snapping to 15deg steps means two tags are either
  // clearly different or exactly equal, and never misleadingly close.
  let hue = calc.rem(mixed, 24) * 15

  // Saturation and lightness come from separate reductions of the mixed
  // hash. Previously both derived from `hash` mod divisors of 360, so they
  // were perfectly correlated with hue and added no real variation.
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

== tl;dr:

ML Engineering Manager and AI Hacker, solving the hardest problems by delivering bleeding-edge research into production. I have worked for 20+ years as a Researcher, Engineer, and Manager, tackling problems at every level: real-time scale, frontier
innovation, and shipping usable products. My teams and I have consistently solved complex problems, owned a ton of infrastructure, and celebrated the delivery of ambitious projects. These days I'm bringing closed-source-level performance to on-prem: fine-tuned open-weight models and evaluation stacks that run entirely inside the boundary, no data egress. Whatever my ikigai is, it braids Mathematics and Programming; lfg.

#grid(
  columns: (auto, 1fr),
  column-gutter: 1em,
  row-gutter: 0.25em,
  inset: (x: 0.0em, y: 0.3em),
  // the achievements list indents its text by the bullet marker's width, so the
  // other rows get matching padding to line their text up with it
  [ *ML + AI* ], [ #pad(left: 0.75em)[ #tech[LLMs], #tech[Generative AI], #tech[AI Agents], #tech[RAG], #tech[Fine-tuning], #tech[PyTorch], #tech[vLLM], #tech[Evals], #tech[Knowledge Graphs] ] ],
  [ *Engineering + Platform* ], [ #pad(left: 0.75em)[ #tech[Terraform], #tech[Kubernetes], #tech[MLOps], #tech[Airflow], #tech[Kafka], #tech[Celery], #tech[AWS], #tech[GCP], #tech[Golang], #tech[Python] ] ],
  [ *Achievements* ], [
    #set list(indent: 0em, body-indent: 0.4em)
    - #link("https://github.com/Lazarus-AI/clearwing")[Building Clearwing], an autonomous vulnerability scanner and source-code hunter - AI cyber security research
    - #link("https://www.economist.com/briefing/2026/06/25/ai-models-values-are-very-different-from-most-peoples")[Curated data collection and evaluation of unaligned models] - covered in The Economist
    - #link("https://huggingface.co/pool-water/script-kiddie")[Fine-tuned Qwen3] for vulnerability scanning and tool usage
    - #link(<sec-oracle>)[Managed Backend and Data Engineering teams] solving large-scale data problems
    - #link(<sec-warmer>)[Launched innovative, agent-based, llm-powered products]
    - #link(<sec-oracle-engineer>)[Architected and deployed massive-scale, real-time data pipelines]: 1.2M+ records/second
    - #link(<sec-oracle-engineer>)[Maintained infrastructure comprising 1,000+ instances]
    - #link(<sec-freelance>)[Freelanced as a Founding AI Engineer], building ML applications for seed-stage companies
    - #link(<sec-freelance-synthetic>)[Fine-tuned Mixtral] to build red-team models for synthetic data generation
  ],
  [ *Education* ], [ #pad(left: 0.75em)[ Bachelor of Science, Mathematics - Boston University ] ],
)


== Work Experience

=== #job([Lazarus AI <sec-lazarus>], "ML Engineering Manager", "October 2025 - Present")

#link("https://www.lazarusaie.com/research")[Leading ML engineering and applied research] across a broad portfolio: AI-driven
exploit analysis and penetration testing, document extraction, on-premise
contract-driven projects, and confidential computing. Consulting to core
engineering on a per-project basis, bringing bleeding-edge research into
production systems.

- Drove evaluation-driven engineering culture, improving document extraction correctness from 20% to 85%
- Demonstrated end-to-end AI-driven vulnerability scanning to RCE using self-hosted unaligned open-weight models - #tech[Clearwing]
- Directed four concurrent project lines as ML Engineering Manager: on-prem privacy-focused public-sector delivery, 1,000+-page insurance underwriting documents, evaluation of novel unaligned fine-tunes, and the Clearwing adversarial security harness
- Managed ML team with rotating contributors, providing technical direction and per-project leadership to core engineering
- Built evaluation harnesses across document extraction, agentic task performance, and CVE exploit validation: LLM-as-judge, golden datasets, offline + CI benchmarking - #tech[Langfuse], #tech[Python]
- Overhauled LLM observability to run fully on-prem under HIPAA and SOC 2 constraints - zero third-party data egress: trace propagation, cost tracking, and evals - #tech[Langfuse], #tech[k3s], #tech[HIPAA], #tech[SOC 2]
- Shipped features for Clearwing, an autonomous vulnerability research agent: sandboxed analysis, exploit validation, budget-bounded orchestration - #tech[Python], #tech[Docker]
- Fine-tuned and deployed open-weight models on self-hosted inference infrastructure - #tech[vLLM], #tech[LoRA], #tech[k3s]
- Owned data collection and evaluation for #link("https://huggingface.co/Lazarus-Ai/models")[ReAligned], a Qwen3.5 finetune eliminating propaganda, lying, and gaslighting: 0.8B - 35B public, plus privately-released 122B and 397B variants; covered in #link("https://www.economist.com/briefing/2026/06/25/ai-models-values-are-very-different-from-most-peoples")[The Economist] - #tech[Qwen3.5]
- Architected multi-model routing layer with confidence scoring, OCR grounding, and post-inference validation - #tech[LangGraph]
- Owned production ML platform: k3s cluster, ArgoCD, LiteLLM, Dagster pipelines - #tech[Terraform], #tech[Kubernetes]

=== #job([Warmer <sec-warmer>], "Founding AI Engineer", "November 2024 - October 2025")

Building the future of Financial Advisory. In this role, I launched two AI
products from zero to production: a financial advisor assistant and intelligent
client-advisor matching system, optimizing Cost-per-Lead.


- Zero-to-One: founded and scaled AI product from zero to first paying customer -
  #tech[LangGraph], #tech[OpenAI], #tech[Python]
- Built conversational, lead-gen agent, the foundation of the new business model -
  #tech[LangGraph], #tech[LLM]
- Achieved \<1% hallucinations on golden-set evals through grounding and post-inference validation -
  #tech[LangGraph], #tech[LangSmith]
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



=== #job([AI Consulting <sec-freelance>], "AI Consultant and Contractor", "September 2023 - November 2024")

Contracted with several early-stage startups, building out AI products.

==== WorkMate Labs: Workmate is your AI teammate
- Designed and built a Digital Assistant, automating task extraction and email drafting - #tech[LLM], #tech[TypeScript]
- Designed and deployed LLM Prompts for contextual, personal email drafting - #tech[ChatGPT], #tech[Gemini], #tech[LLM]
- Designed and deployed custom evaluation framework for measuring LLM performance - #tech[LangSmith], #tech[TypeScript]
- Designed retrieval system for context-aware search of similar sent emails - #tech[Retrieval], #tech[TypeScript]

==== Stealth Startup: FoodTech, translating conversations into API calls
- Fine-tuned Dolphin Mixtral to improve conversational style <sec-freelance-synthetic> - #tech[Mixtral], #tech[HuggingFace], #tech[Python]
- Designed and built question-answering workflows inspired by Graph-of-thoughts - #tech[OpenAI API], #tech[Python]
- Designed and built SMS-based chat interface to LLMs - #tech[Amazon Bedrock], #tech[LangChain], #tech[Twilio], #tech[Python]
- Automated MLOps for LLM-based projects - finetuning, testing, deployment, and performance evaluation
- Designed and deployed IaC for all services - #tech[Terraform]

==== Stealth Startup: Generative AI Customers as a service
- Diagnosed and solved a mission-critical problem for scheduling flow of traffic to clients - #tech[Math]!
- Designed and built API to develop, simulate, and actually orchestrate system traffic flows - #tech[Python]
- Standardized MLOps approach for use with Stable Diffusion and LLMs - #tech[Terraform]
- Designed and built tooling to monitor, compare, and research LLM performance - #tech[Python], #tech[LLM], #tech[LLaMa]

=== #job([Owl.co], "Software Engineer", "January 2023 - September 2023")

Returning to the startup world, I designed and built products, catering to the Insurance Industry, with a focus on integrating Machine Learning with Human tasks. Here my focus was on ML products instead of Data scale.

- Led an interdisciplinary team building ML products, automating tasks performed by human investigators: scraping the web, classifying documents, designing ETLs - #tech[Clojure], #tech[PyTorch], #tech[Presto], #tech[Spark]
- Architected systems to integrate ML inference with human-driven tasks - #tech[Clojure], #tech[Amazon SageMaker]
- Automated hundreds of daily insurance claims investigations with the use of ML, reducing manual investigations by 70%
- Designed and built ETL workflows for analytic databases - #tech[Airflow], #tech[Spark]
- Built dashboards tracking performance of ML models against their human counterparts - #tech[Presto], #tech[Airflow]
- Deployed and maintained infrastructure - #tech[AWS CloudFormation], #tech[Amazon SageMaker]
- Mentored mid-level Engineers on Data Engineering

=== #job([Sabbatical], "Career Break", "October 2021 - January 2023")

- Traded the post-acquisition golden handcuffs for plane tickets
- Came back deliberately, trading scale for deep focus in AI

=== #job([Oracle Data Cloud, MOAT <sec-oracle>], "Software Engineering Manager", "December 2019 - October 2021")

I led a highly technical team to create a vast, event-level data store, used as the source-of-truth for the suite of MOAT products. The real-time system processes 1.2M+ records/second, and requires zero downtime. Consequently, I grew a team with high technical aptitude, and emphasized ownership as a core principle in Software Development.

- Managed and grew team of 7 Data Engineers, ranging from College Recruit to Senior Engineer
- Built multiyear Software Roadmap with Engineering Managers and Product Owners
- Mentored and promoted every Software Engineer on my team
- Collaborated with ML Engineers and Data Scientists to release and update models in production code
- Collaborated with outside Engineering and Data Science stakeholders to design a flexible data pipeline
// - Organized and led "Agile" rituals - Sprint Planning, Sprint Review, and Backlog Grooming
- Led project to migrate legacy systems from EC2 to Kubernetes (EKS) - #tech[Kubernetes]
- Migrated legacy core business logic to modern systems - #tech[Kafka], #tech[Airflow]
- Managed a team owning 1,000+ instances - #tech[AWS]
- Managed a budget of \$340,000+ per month
- Authored technical proposals for Data Privacy, System Architecture, and Wire Protocols
- Co-wrote and presented software application proposals, detailing and defending technology decisions
- Reviewed and approved technical design proposals and outage postmortems

=== #job([Oracle Data Cloud, MOAT <sec-oracle-engineer>], "Tech Lead, Data Engineering", "February 2017 - December 2019")

I stabilized and scaled a massive computing cluster, halved instance count, and saved over \$2M annually. Comprising a massive 30k-line codebase, the real-time system contained all business logic to power the MOAT dashboard, and required biweekly deployments. Here, I emphasized stability and correctness, deploying frequent changes across 1,000+ instances.

- Managed weekly software releases for core business logic, contributed to by 4 distinct teams
- Built multiyear roadmap for the data pipeline, and the systems that power it
- Onboarded all new hires to MOAT's data pipeline
- Designed and built stream-processing applications processing 1.2M+ events/second - #tech[Golang], #tech[Python], #tech[Kafka]
- Designed and built system-wide wire protocol - #tech[Protobuf]
- Built custom software that reduced instance count by 50%, saving over \$2M dollars - #tech[Golang]
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

=== #job([Harvard University, IQSS <sec-research>], "Statistical Programmer, Software Maintainer", "May 2010 - July 2013")

Statistical software and data privacy research at Harvard's Institute for
Quantitative Social Science. Where I learned to turn research ideas into
production, open-source code.

- Developed and maintained #link("https://zelig.hsites.harvard.edu")[Zelig], an open-source statistical package unifying model interfaces - #tech[R]
- Contributed statistical analysis software to #link("https://dataverse.harvard.edu")[Dataverse], open-source infrastructure for research data sharing, preservation, and citation - #tech[Java], #tech[R]
- Built the Zelig extension to the Dataverse network - #tech[Java]
- Taught statistical programming workshops - beginner through developing statistical packages

// === #job([New England Complex Systems Institute], "Research Assistant", "2005 - 2008")
//
// Applied Mathematics and complex systems research - the foundation of everything since.
//
// - Developed simulations and mathematical models - #tech[Python]
// - Assisted lecturers for course in Simulation and Mathematical Modeling
// - Built the software substrate for research projects: web applications and MediaWiki extensions - #tech[LAMP], #tech[PHP]
