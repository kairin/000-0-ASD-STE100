# Cost-aware agent routing

Status: proposed. Use the current [system-architect skill](../000-0-ai/skills/system-architect/SKILL.md) and [fleet-dispatch skill](../000-0-ai/skills/fleet-dispatch/SKILL.md) for architecture roles, model routes, task permissions and evidence rules.

The primary session keeps its current model. Invoke a separate architect for architecture work. A coordinator assigns bounded work to named worker models. The caller checks worker results and sends evidence to the architect. Use the host table in the system-architect skill for supported routes and limits. Do not copy a second task schema or model map into this repository.

GPT Codex Spark remains opt-in. Do not select it by default. The owner must enable it for a run or profile and check the effective model.

Keep one durable work identity. GitHub Issues remain the durable identity. Hermes Kanban can act as an execution view keyed to issue IDs. Do not create duplicate task records without links.
